module Spec.Deploybot.Deploybot (tests) where
--

import Test.Tasty.HUnit ((@?=), Assertion, testCase)
import Test.Tasty (TestTree, testGroup)

(===) :: (Eq a, Show a) => a -> a -> Assertion
(===) = (@?=)
infixl 1 ===

tests :: TestTree
tests = testGroup "Deploybot" [
  testCase "initial" $ do
    let
      expected = True
      actual = False
    actual === expected
 ]

----------------------------------------------------------