module WordaApi.Parser
( WordFrequency
, parse
) where

type WordFrequency = (String, Int)

parse :: String -> [WordFrequency]
parse = map parseLine . lines

parseLine :: String -> WordFrequency
parseLine line = (word, read frequency)
  where
    (word:frequency:_) = words line
