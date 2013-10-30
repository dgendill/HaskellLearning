# run in GHCI
# https://en.wikibooks.org/wiki/Haskell/Category_theory
# A basic function
myAdd x y = x + y

# The identity function multipled by any function is itself
# idX(x) = x
# . is the composition function.  "The composition of myAdd and
# the identity function is myAdd"
# True
(myAdd . id) 5 5 == myAdd 5 5

let addOne x = x+1
let addTwo x = x+2
:t (addOne . addTwo)
let multiplyByTen x = x * 10
(addTwo . multiplyByTen) 1
(multiplyByTen . addTwo) 1
