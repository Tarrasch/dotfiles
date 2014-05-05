module GetProfile
  (
    getProfile
  , Profile(..)
  )
  where

import GetHostName (getHostName)
import Data.List (isInfixOf)

data Profile =
    Spotify  -- ^ My work computer
  | Rest     -- ^ Personal computers I use
  deriving (Show, Read, Eq)

getProfile :: IO (Profile)
getProfile = do
  hostName <- getHostName
  let isSpotify = "spotify" `isInfixOf` hostName
  return $ if isSpotify
           then Spotify
           else Rest
