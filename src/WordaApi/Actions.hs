module WordaApi.Actions
( Action
, get
) where

type Action = [String] -> IO ()

get :: Action
get [] = return ()
get (lang:languages) = putStrLn lang
