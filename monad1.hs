import Control.Monad
import Data.Maybe

describeInt::Int -> Maybe String
describeInt x
       | x <= 0 = Nothing
       | otherwise = Just ("A nice number "++show x)



--lets create a function which takes a String and returns if the length of the string is > 0
talkAboutString::String -> Maybe Bool
talkAboutString input
      | length input == 0 = Just False
      | otherwise = Just True


-- now describeInt and talkAboutString can be used with >>=, since both share the same Monad M - in this case Maybe
-- but when you use the >>= with (describeInt 9) >>= talkAboutString, you will get a new composition - Int -> Maybe Bool
-- so in effect you have composed Int->Maybe String and String->Maybe Bool to Int -> Maybe Bool
-- Note that the Monad M is same in both cases - Maybe
