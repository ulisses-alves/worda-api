module WordaApi.Cli
( handle
) where

import System.Environment (getArgs)
import WordaApi.Actions (Action, get)

handle :: IO ()
handle = do
    execArgs <- getArgs 
    case execArgs of
        []            -> putStrLn usage
        (action:args) -> dispatch action args

dispatch :: String -> [String] -> IO ()
dispatch actionName args = case lookup actionName actions of
    Nothing     -> putStrLn "Invalid action"
    Just action -> action args

actions :: [(String, Action)]
actions = [("get", get)]

usage :: String
usage = "worda-api [action] [args]"
