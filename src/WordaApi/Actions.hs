module WordaApi.Actions
( Action
, get
) where

import System.IO
import Paths_worda_api (getDataFileName)
import WordaApi.Util.Substitute ((%))

type Action = [String] -> IO String

get :: Action
get [] = return ""
get (lang:languages) = readFile =<< getDataFileName path
  where
    path = "data/words/%.txt" % [lang]
