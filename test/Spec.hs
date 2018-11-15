module Main where
--
import Test.Tasty (TestTree, testGroup, defaultMain)

import qualified Spec.Deploybot.Deploybot as Deploybot (tests)

main :: IO ()
main = defaultMain tests

tests :: TestTree
tests = testGroup "deploybot-hs" [
  Deploybot.tests
 ]