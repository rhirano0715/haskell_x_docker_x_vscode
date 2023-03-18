module MyLibSpec (spec) where

import Test.Hspec
import MyLib

spec :: Spec
spec = do
    describe "`addInt` takes two arguments of Int and returns the result of adding them." $ do
        it "When give addInt 1 and 2 then return 3" $
            MyLib.addInt 1 2 `shouldBe` 2
