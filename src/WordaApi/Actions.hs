module WordaApi.Actions
( Action
, get
) where

import System.IO (readFile)
import Paths_worda_api (getDataFileName)
import WordaApi.Parser (parse)
import WordaApi.Util.Substitute ((%))

type Action = [String] -> IO String

get :: Action
get [] = return ""
get (lang:languages) = fmap (show . parse) content
  where
    path = "data/words/%.txt" % [lang]
    content = readFile =<< getDataFileName path
