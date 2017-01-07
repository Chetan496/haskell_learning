doubleMe x = x + x

doubleSmallNumber x = if x > 100
                        then x
                        else x*2

removeNonUppercase st = [ c | c <- st, elem c ['A'..'Z'] ]

sayMe :: (Integral a) => a -> String
sayMe 1 = "One!"
sayMe 2 = "Two!"
sayMe 3 = "Three!"
sayMe 4 = "Four!"
sayMe 5 = "Five!"
sayMe x = "Not between 1 and 5"

factorial :: (Integral a ) => a -> a
factorial 0 = 1
factorial n = n * factorial (n - 1)

head' :: [a] -> a
head' [] = error "Cant call head on an empty list, dummy!"
head' (x:_) = x

