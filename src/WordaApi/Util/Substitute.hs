module WordaApi.Util.Substitute
( substitute
, (%)
) where

substitute :: (Eq a) => a -> [a] ->  [[a]] -> [a]
substitute _ xs [] = xs
substitute _ [] _ = []
substitute token (x:xs) (a:args)
    | token == x = a ++ substitute token xs args
    | otherwise  = x : substitute token xs (a:args)

(%) :: String -> [String] -> String
(%) = substitute '%'
infixl 7 %
