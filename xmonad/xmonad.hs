{-# LANGUAGE RecordWildCards #-}
import XMonad
import XMonad.Config.Gnome
import XMonad.Colemak
import XMonad.Actions.WindowGo
import XMonad.Layout.IndependentScreens
import XMonad.Actions.SwapWorkspaces
import qualified Data.Map        as M
import qualified XMonad.StackSet as W

-- This file can be tested out (before doing alt-q) with ghci:
--
--     ghci -ilib xmonad.hs

myManageHook = composeAll (
    [ manageHook gnomeConfig

    -- Unity compatibility
    , className =? "Unity-2d-panel" --> doIgnore
    , className =? "Unity-2d-launcher" --> doFloat

    -- Gnome DO
    , resource  =? "Do"   --> doIgnore
    ])

myKeys = idHook
    <+> workspaceKeys
    <+> colemakKeys
    <+> unityLauncherLikeKeys
    <+> swapWorkspaceKeys

gmailInFirefox :: X ()
gmailInFirefox =
  spawn "xdotool search 'Mozilla Firefox' windowactivate --sync key --clearmodifiers 'alt+1'"

unityLauncherLikeKeys = const $ M.fromList $ concatMap aux [
      t xK_a "nemo" "Nemo"
    , t xK_r "gnome-terminal" "Gnome-terminal"
    , t xK_s "firefox" "Firefox"
    , t xK_t "thunderbird" "Thunderbird"
    , t xK_n "rednotebook" "Rednotebook"
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

myConfig = gnomeConfig {
    manageHook = myManageHook
  , keys = myKeys
    }

oneToNine = map show [1 :: Int .. 9]

workspaceKeys conf = let modm = modMask conf
                     in M.fromList $
    -- Regular jumping but for independent screens
    [((m .|. modm, k), windows $ onCurrentScreen f i)
        | (i, k) <- zip oneToNine [xK_1 .. xK_9]
        , (f, m) <- [(W.greedyView, 0), (W.shift, shiftMask)]]

    -- Swap workspaces
     ++
     [((modm .|. controlMask, k), windows $ onCurrentScreen swapWithCurrent i)
         | (i, k) <- zip oneToNine [xK_1 ..]]


main = do
  nScreens <- countScreens
  xmonad $ myConfig {
      workspaces = withScreens nScreens oneToNine
    }
