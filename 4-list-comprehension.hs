module Main where

test m n = [(x,y) | x <- [1..m], y <- [1..m], x+y==n]
let b = map test (zip [1..10] (take 10 (repeat 10)))

-- filter (\x -> x `mod` 2 == 0) [0..10]