module GetProfile
  (
    getProfile
  , Profile(..)
  )
  where

import GetHostName (getHostName)
import Data.List (isInfixOf)

data Profile =
    Rest     -- ^ Personal computers I use
  deriving (Show, Read, Eq)

getProfile :: IO (Profile)
getProfile = return Rest
