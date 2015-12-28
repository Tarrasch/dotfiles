{-# LANGUAGE RecordWildCards #-}
import XMonad
import XMonad.Config.Gnome
import XMonad.Colemak
import XMonad.Actions.WindowGo
import XMonad.Config.Xfce
import qualified XMonad.ManageHook as ManageHook
import qualified XMonad.Layout.IndependentScreens as IS
import XMonad.Actions.SwapWorkspaces
import qualified Data.Map        as M
import qualified XMonad.StackSet as W
import XMonad.Hooks.SetWMName (setWMName) -- For IntelliJ
import GetProfile (getProfile, Profile(Rest))
import XMonad.Hooks.EwmhDesktops (ewmh) -- http://ohspite.net/2013/05/02/keepass-global-autotype-in-xmonad/
import qualified Graphics.X11.ExtraTypes.XF86 as XF86

-- This file can be tested out (before doing alt-q) with ghci:
--
--     $ cd ~/dotfiles/xmonad
--     $ ghci -ilib xmonad.hs

myKeysP :: Profile -> (XConfig Layout -> M.Map (ButtonMask, KeySym) (X ()))
myKeysP profile = idHook
    <+> workspaceKeys
    <+> colemakKeys
    <+> unityLauncherLikeKeysP profile
    <+> swapWorkspaceKeys
    <+> spotifyKeys
    <+> volumeKeys
    <+> lockScreenKeys

-- | Lock screen, using slock for now (suckless software)
--
--   $ canhaz suckless-tools
lockScreenKeys (XConfig {..}) =
    M.fromList [((ctrlPlusAlt, xK_l),         spawn "slock")]
  where
    ctrlPlusAlt = controlMask .|. mod1Mask :: ButtonMask


-- | Controlling volume, in case you don't have that built in to your desktop
-- environment.
--
-- http://superuser.com/q/389737/97600
volumeKeys (XConfig {..}) =
  M.fromList $
    [((mod4Mask, xK_u),         amixer "4%-"),
     ((mod4Mask, xK_y),         amixer "4%+"),
     ((mod4Mask, xK_semicolon), amixer "toggle"),
    -- This didn't work
     ((noModMask, XF86.xF86XK_AudioLowerVolume), amixer "4%-"),
     ((noModMask, XF86.xF86XK_AudioRaiseVolume), amixer "4%+"),
     ((noModMask, XF86.xF86XK_AudioMute),        amixer "toggle")]
  where
    noModMask = 0 :: ButtonMask

amixer :: String -> X ()
amixer cmd = spawn $ "amixer -D pulse sset Master " ++ cmd

-- | Controlling spotify hack
--
-- Assuming the existence of binary in ~/.bin/spotifycommand.exe
-- (Get the binary from https://github.com/Tarrasch/SpotifyWinCmd, also, it is
-- just a bash script and not a binary, so the spotifycommand.exe.so must be
-- present in ~/.bin as well)
--
--   $ spotifycommand.exe
--   spotify_cmd version 0.5, copyright by Mattias Runge 2009
--   Usage: ./spotify_cmd [playpause|prev|next|stop|mute|volup|voldown|status]
--
-- Note, this is for spotify under wine, not the linux client!
spotifycommand :: String -> X ()
spotifycommand cmd = spawn $ "~/.bin/spotifycommand.exe " ++ cmd

spotifyKeys (XConfig {..}) =
  M.fromList $
    [((mod4Mask, xK_x), spotifycommand "prev"),
     ((mod4Mask, xK_c), spotifycommand "playpause"),
     ((mod4Mask, xK_v), spotifycommand "next")]
    -- [((modMask .|. controlMask, k), windows $ swapWithCurrent i)
    --   | (i, k) <- zip workspaces [xK_1 .. xK_9]]

-- | Move to first tab in firefox, use like this:
--
--      [
--        ((mod4Mask              , xK_t ), gmailInFirefox )
--      ]
--
--  And don't forget to do
--
--      sudo apt-get install xdotool
--
--  Also, this is required:
--
--      http://ohspite.net/2013/05/02/keepass-global-autotype-in-xmonad/
gmailInFirefox :: X ()
gmailInFirefox = openFirefoxTab 1

openFirefoxTab :: Int -> X ()
openFirefoxTab x = spawn $
    "xdotool search 'Mozilla Firefox' windowactivate --sync key --clearmodifiers 'alt+" ++
    show x ++
    "'"

-- In order to get the window names, the commands
--
--    $ xev
--    $ xwininfo
--    $ xprop
--    $ xprop | grep 'WM_CLASS(STRING)'
--
-- Will come in handy
unityLauncherLikeKeysP profile = const $ M.fromList $ concatMap aux [
    -- Applications
      t xK_a "nautilus" "Nautilus"
    , t xK_r "gnome-terminal" "Gnome-terminal"
    , t xK_s "firefox" "Firefox"
    , t xK_t "chromium-browser" "chromium-browser"
  ] ++
  [
    -- Firefox shortcuts
      ((mod4Mask, xK_n), openFirefoxTab 1)
    , ((mod4Mask, xK_e), openFirefoxTab 2)
    , ((mod4Mask, xK_i), openFirefoxTab 3)
    , ((mod4Mask, xK_o), openFirefoxTab 4)
  ]

  where aux (key, process, cN) = [
            ((mod4Mask              , key ), runOrRaiseNext process   (className =? cN       ))
          , ((mod4Mask .|. shiftMask, key ), spawn          process )
          ]
        t a b c = (a, b, c)

swapWorkspaceKeys (XConfig {..}) =
  M.fromList $
    [((modMask .|. controlMask, k), windows $ swapWithCurrent i)
      | (i, k) <- zip workspaces [xK_1 .. xK_9]]

myConfigP profile = desktopConfig {
    manageHook = manageHook desktopConfig
  , keys = myKeysP profile
  , startupHook = setWMName "LG3D" -- For IntelliJ
    }
  where
    desktopConfig = xfceConfig { terminal = "gnome-terminal" }

oneToNine = map show [1 :: Int .. 9]

workspaceKeys conf = let modm = modMask conf
                     in M.fromList $
    -- Regular jumping but for independent screens
    [((m .|. modm, k), windows $ IS.onCurrentScreen f i)
        | (i, k) <- zip oneToNine [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

    -- Swap workspaces
     ++
     [((modm .|. controlMask, k), windows $ IS.onCurrentScreen swapWithCurrent i)
         | (i, k) <- zip oneToNine [xK_1 ..]]


main = do
  nScreens <- return (2) -- IS.countScreens
  profile <- getProfile
  xmonad $ ewmh
         $ (myConfigP profile) {
      workspaces = IS.withScreens nScreens oneToNine
    }
