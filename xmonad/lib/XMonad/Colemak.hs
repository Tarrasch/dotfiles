module XMonad.Colemak where

import XMonad
import System.Exit

import qualified XMonad.StackSet as W
import qualified Data.Map        as M


colemakKeys conf@(XConfig {XMonad.modMask = modMask}) = M.fromList $

    -- launch a terminal
    [ ((modMask .|. shiftMask, xK_Return), spawn $ XMonad.terminal conf)

    -- launch dmenu
    , ((modMask,               xK_l     ), spawn "exe=`dmenu_path | dmenu` && eval \"exec $exe\"")

    -- launch gmrun
    , ((modMask .|. shiftMask, xK_l     ), spawn "gmrun")

    -- close focused window
    , ((modMask .|. shiftMask, xK_k     ), kill)

     -- Rotate through the available layout algorithms
    , ((modMask,               xK_space ), sendMessage NextLayout)

    --  Reset the layouts on the current workspace to default
    , ((modMask .|. shiftMask, xK_space ), setLayout $ XMonad.layoutHook conf)

    -- Resize viewed windows to the correct size
    , ((modMask,               xK_slash ), refresh)

    -- Move focus to the next window
    , ((modMask,               xK_Tab   ), windows W.focusDown)

    -- Move focus to the next window
    , ((modMask,               xK_n     ), windows W.focusDown)

    -- Move focus to the previous window
    , ((modMask,               xK_e     ), windows W.focusUp  )

    -- Move focus to the master window
    , ((modMask,               xK_m     ), windows W.focusMaster  )

    -- Swap the focused window and the master window
    , ((modMask,               xK_Return), windows W.swapMaster)

    -- Swap the focused window with the next window
    , ((modMask .|. shiftMask, xK_n     ), windows W.swapDown  )

    -- Swap the focused window with the previous window
    , ((modMask .|. shiftMask, xK_e     ), windows W.swapUp    )

    -- Shrink the master area
    , ((modMask .|. shiftMask, xK_z     ), sendMessage Shrink)

    -- Expand the master area
    , ((modMask,               xK_z     ), sendMessage Expand)

    -- Push window back into tiling
    , ((modMask,               xK_period), withFocused $ windows . W.sink)

    -- Increment the number of windows in the master area
    , ((modMask              , xK_a     ), sendMessage (IncMasterN 1))

    -- Deincrement the number of windows in the master area
    , ((modMask .|. shiftMask, xK_a     ), sendMessage (IncMasterN (-1)))


    -- toggle the status bar gap
    -- TODO, update this binding with avoidStruts
    ----, ((modMask              , xK_apostrophe )),

    -- Quit xmonad
    , ((modMask .|. shiftMask, xK_q     ), io (exitWith ExitSuccess))

    -- Restart xmonad
    , ((modMask              , xK_q     ), restart "xmonad" True)
    ]
