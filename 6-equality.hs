lucy :: (Eq a, Num a) => [a] -> String
lucy list
  | first == 7 = "First is 7"
  | last == 7 = "Last is 7"
  where (first:_) = list
        (_:last) = list