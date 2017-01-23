-- a leap year
-- occurs on every year that is evenly divisible by 4
-- except every year that is evenly divisible by 100
-- unless the year is also evenly divisible by 400

--logic: if the year is divisible by 4, then its a candidate for leap year. But if it is also divisble by 100, then it must be divisible by 400


isLeapYear :: Int -> Bool
isLeapYear x
   | ((x `mod` 4) /= 0) = False
   | ((x `mod` 100) == 0) = ((x `mod` 400) == 0)
   | otherwise = True
