{-# LANGUAGE RecordWildCards #-}
import XMonad
import XMonad.Config.Gnome
import XMonad.Colemak
import XMonad.Actions.WindowGo
import qualified XMonad.Layout.IndependentScreens as IS
import XMonad.Actions.SwapWorkspaces
import qualified Data.Map        as M
import qualified XMonad.StackSet as W
import XMonad.Hooks.SetWMName (setWMName) -- For IntelliJ
import XMonad.Hooks.ICCCMFocus (takeTopFocus) -- For IntelliJ
import GetProfile (getProfile, Profile(Spotify, Rest))

-- This file can be tested out (before doing alt-q) with ghci:
--
--     $ cd ~/dotfiles/xmonad
--     $ ghci -ilib xmonad.hs

myManageHook = composeAll (
    [ manageHook gnomeConfig

    -- Unity compatibility
    , className =? "Unity-2d-panel" --> doIgnore
    , className =? "Unity-2d-launcher" --> doFloat

    -- Gnome DO
    , resource  =? "Do"   --> doIgnore
    ])

myKeysP profile = idHook
    <+> workspaceKeys
    <+> colemakKeys
    <+> unityLauncherLikeKeysP profile
    <+> swapWorkspaceKeys
    <+> spotifyKeys

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
gmailInFirefox :: X ()
gmailInFirefox =
  spawn "xdotool search 'Mozilla Firefox' windowactivate --sync key --clearmodifiers 'alt+1'"

-- In order to get the window names, the commands
--
--    $ xev
--    $ xwininfo
--    $ xprop
--    $ xprop | grep 'WM_CLASS(STRING)'
--
-- Will come in handy
unityLauncherLikeKeysP profile = const $ M.fromList $ concatMap aux [
      key_a
    , t xK_r "gnome-terminal" "Gnome-terminal"
    , t xK_s "firefox" "Firefox"
    , t xK_n "rednotebook" "Rednotebook"
  ] ++
  concat [
    key_t
  ]
  where aux (key, process, cN) = [
            ((mod4Mask              , key ), runOrRaiseNext process   (className =? cN       ))
          , ((mod4Mask .|. shiftMask, key ), spawn          process )
          ]
        t a b c = (a, b, c)
        key_a = case profile of
                  Spotify -> t xK_a "nautilus" "Nautilus"
                  Rest    -> t xK_a "nemo" "Nemo"
        key_t = case profile of
                  Spotify -> [((mod4Mask              , xK_t ), gmailInFirefox )]
                  Rest    -> aux $ t xK_t "thunderbird" "Thunderbird"

swapWorkspaceKeys (XConfig {..}) =
  M.fromList $
    [((modMask .|. controlMask, k), windows $ swapWithCurrent i)
      | (i, k) <- zip workspaces [xK_1 .. xK_9]]

myConfigP profile = gnomeConfig {
    manageHook = myManageHook
  , keys = myKeysP profile
  , startupHook = setWMName "LG3D" -- For IntelliJ
  , logHook = takeTopFocus -- For IntelliJ
    }

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
  xmonad $ (myConfigP profile) {
      workspaces = IS.withScreens nScreens oneToNine
    }
