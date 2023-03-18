module Main where

import Test.DocTest

main :: IO ()
main = doctest ["src/MyLib.hs", "app/Main.hs"]
