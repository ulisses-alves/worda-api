module WordaApi.Actions
( Action
, get
) where

import Control.DeepSeq
import System.IO (hGetContents, hSetEncoding, withFile, utf8, IOMode(..))
import Paths_worda_api (getDataFileName)
import WordaApi.Parser (WordFrequency, parse)
import WordaApi.Util.Substitute ((%))

type Action = [String] -> IO String

get :: Action
get [] = return ""
get (lang:languages) = do
    fileName <- getDataFileName path
    withFile fileName ReadMode $ \handle -> do
        hSetEncoding handle utf8
        items <- fmap (show . parse) . hGetContents $ handle
        return $!! items
  where
    path = "data/words/%.txt" % [lang]
