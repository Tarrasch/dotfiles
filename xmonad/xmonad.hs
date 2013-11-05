{-# LANGUAGE RecordWildCards #-}
import XMonad
import XMonad.Config.Gnome
import XMonad.Colemak
import XMonad.Actions.WindowGo
import XMonad.Actions.SwapWorkspaces
import qualified Data.Map        as M

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

myKeys = colemakKeys <+> unityLauncherLikeKeys <+> swapWorkspaceKeys

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

main = xmonad myConfig
