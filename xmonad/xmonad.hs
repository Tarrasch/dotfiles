import XMonad
import XMonad.Config.Gnome
import XMonad.Colemak

myManageHook = composeAll (
    [ manageHook gnomeConfig

    -- Unity compatibility
    , className =? "Unity-2d-panel" --> doIgnore
    , className =? "Unity-2d-launcher" --> doFloat

    -- Gnome DO
    , resource  =? "Do"   --> doIgnore

    ])

myKeys = colemakKeys

myConfig = gnomeConfig {
    manageHook = myManageHook
  , keys = myKeys
    }

main = xmonad myConfig
