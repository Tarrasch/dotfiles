import XMonad
import XMonad.Config.Gnome
import XMonad.Colemak
import XMonad.Actions.WindowGo
import qualified Data.Map        as M

myManageHook = composeAll (
    [ manageHook gnomeConfig

    -- Unity compatibility
    , className =? "Unity-2d-panel" --> doIgnore
    , className =? "Unity-2d-launcher" --> doFloat

    -- Gnome DO
    , resource  =? "Do"   --> doIgnore
    ])

myKeys = colemakKeys <+> unityLauncherLikeKeys

unityLauncherLikeKeys = const $ M.fromList $ concatMap aux [
      t xK_a "nautilus" "Nautilus"
    , t xK_r "gnome-terminal" "Gnome-terminal"
    , t xK_s "firefox" "Firefox"
    , t xK_t "thunderbird" "Thunderbird"
  ]
  where aux (key, process, cN) = [
            ((mod4Mask              , key ), runOrRaiseNext process   (className =? cN       ))
          , ((mod4Mask .|. shiftMask, key ), spawn          process )
          ]
        t a b c = (a, b, c)

myConfig = gnomeConfig {
    manageHook = myManageHook
  , keys = myKeys
    }

main = xmonad myConfig
