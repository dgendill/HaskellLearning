module Main where

lucky :: (Integral a) => a -> String
lucky 7 = "Lucky Seven"
lucky x = "Not lucky Seven"

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial x = x * factorial (x-1)

last' :: [a] -> a
last' [] = error "Empty list!"
last' x = (reverse x) !! 0

length' :: (Num a) => [a] -> a
length' [] = 0
length' [x] = 1
length' (_:x) = 1 + length' x

sum' :: (Num a) => [a] -> a
sum' [] = 0
sum' [x] = x
sum' (_:x) = sum' x

max' :: (Ord a) => a -> a -> a
max' x y
 | x > y     = x
 | otherwise = y

initials :: String -> String -> String
initials firstname lastname = [f] ++ [l]
        where (f:_) = firstname
              (l:_) = lastname

compareWithHundred :: (Num a, Ord a) => a -> Ordering  
compareWithHundred = compare 100