{-# LANGUAGE OverloadedStrings #-}
{-# LANGUAGE ExtendedDefaultRules #-}
module MyAntigen where

import Antigen (AntigenConfig (..)
              , defaultConfig
              , bundle
              , antigen
              , antigenSourcingStrategy)

bundles =
  [ bundle "Tarrasch/zsh-functional"
  , bundle "Tarrasch/zsh-bd"
  , bundle "Tarrasch/zsh-command-not-found"
  , bundle "Tarrasch/zsh-colors"
  , bundle "Tarrasch/zsh-autoenv"
  , bundle "Tarrasch/zsh-i-know"
  , bundle "Tarrasch/pure"
  , bundle "Tarrasch/zsh-mcd"
  , bundle "zsh-users/zsh-syntax-highlighting"
  , (bundle "zsh-users/zsh-history-substring-search") { sourcingStrategy = antigenSourcingStrategy }
  ]

config = defaultConfig { plugins = bundles }

main :: IO ()
main = antigen config
