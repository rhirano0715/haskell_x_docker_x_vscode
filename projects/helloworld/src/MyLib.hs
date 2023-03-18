module MyLib (someFunc, addInt) where

-- |
-- Function sample
-- >>> someFunc
-- someFunc
someFunc :: IO ()
someFunc = putStrLn "someFunc"

addInt :: Int -> Int -> Int
addInt x y = x + y
