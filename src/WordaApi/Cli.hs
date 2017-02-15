module WordaApi.Cli
( handle
) where

import System.Environment (getArgs, getProgName)
import WordaApi.Util.Substitute ((%))
import WordaApi.Actions (Action, get)

handle :: IO ()
handle = do
    execArgs <- getArgs
    case execArgs of
        []            -> putStrLn =<< usage
        (action:args) -> case dispatch action args of
            Left error   -> putStrLn error
            Right result -> putStrLn =<< result

dispatch :: String -> [String] -> Either String (IO String)
dispatch actionName args = case lookup actionName actions of
    Nothing     -> Left "Invalid action name"
    Just action -> Right $ action args

actions :: [(String, Action)]
actions = [("get", get)]

usage :: IO String
usage = getMessage =<< getProgName
  where
    getMessage progName = return $ "Usage: % [action] [args]" % [progName]
