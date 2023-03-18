module Main where

import qualified MyLib (someFunc)

-- |
-- Entry point
-- >>> main
-- Hello, Haskell!
-- someFunc
main :: IO ()
main = do
  putStrLn "Hello, Haskell!"
  MyLib.someFunc
