import Data.Fixed
import Data.List
import SVGWrapper

month :: Float -> Float
month m = (mod' (m + 9) 12) + 1

year :: Float -> Float
year y = read (drop 2 (show y)) :: Float

yearModifier :: (Float, Float) -> Float
yearModifier (1,y) = y - 1
yearModifier (2,y) = y - 1
yearModifier (_,y) = y

century :: Float -> Float
century c = read (take 2 (show c)) :: Float

weekday :: (Int, Int, Int) -> Int
weekday (m,d,y) = truncate (mod' (md + (fromIntegral (floor (2.6 * (month mm) - 0.2))) +
        year(mmy) +
        (fromIntegral (floor (year(mmy) / 4))) +
        (fromIntegral (floor (century(mmy) / 4))) -
        (2 * century(mmy))) 7)
        where my = ((fromIntegral y) :: Float)
              mm = ((fromIntegral m) :: Float)
              md = ((fromIntegral d) :: Float)
              mmy = yearModifier (mm,my)

sortByDate (m1,d1,y1) (m2,d2,y2)
  | y1 < y2 = LT
  | y1 > y2 = GT
  | y1 == y2 = compare m1 m2

weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
years = [2012..2020]
months = take 12 (cycle [1..12])
days = take 1 (repeat 13)
yearList = [(a,b) | a <- months, b <- years]
fridayCount = [(a, 13, b) | (a,b) <- yearList, (weekday (a,13,b)) == 5]

friday13inYear :: Int -> (Int, Int)
friday13inYear y = (truncate (year (fromIntegral y)) , length [(m, 13, y) | (m,y) <- mylist, (weekday (m,13,y)) == 5])
  where mylist = [(a,b) | a <- [1..12], b <- [y]]

toGraph :: (Int, Int) -> (Int, Int)
toGraph (a,b) = (a,100) 

main = do
        mapM putStrLn (map show (filter ((==3).snd) (toGraph (map friday13inYear [2012..2015]))))
