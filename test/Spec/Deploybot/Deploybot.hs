module Spec.Deploybot.Deploybot (tests) where
--

import Test.Tasty.HUnit ((@?=), Assertion, testCase)
import Test.Tasty (TestTree, testGroup)

--import Control.Monad.Trans.Class (lift)
import Control.Monad.Trans.Writer
import Data.Text (Text)

(===) :: (Eq a, Show a) => a -> a -> Assertion
(===) = (@?=)
infixl 1 ===

tests :: TestTree
tests = testGroup "Deploybot" [
  testCase "sends message" $ do
    let
      messageToSend = "Hey there!"

      actual = runBot

    extractMessage actual === [messageToSend]
 ]

type TestWiring = Writer [Text]

instance Slack TestWiring where
  sendMessage msg = tell [msg]

extractMessage :: TestWiring a -> [Text]
extractMessage = snd . runWriter

-- above this line test
----------------------------------------------------------
-- below this line prod

runBot :: (Monad m, Slack m) => m ()
runBot = sendMessage "Hey there!"

class Slack m where
  sendMessage :: Text -> m ()