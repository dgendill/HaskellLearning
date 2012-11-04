import Data.Fixed

--centuryOffset :: Float -> Float
--centuryOffset fullyear = 2 * (3 - (mod' century 4))
--        where century = (read (take 2 (show fullyear)) :: Float)

centuryOffset :: Float -> Float
centuryOffset fullyear = mod' (4 - century) 7
        where century = (read (take 2 (show fullyear)) :: Float)

yearOffset :: Float -> Float
yearOffset fullyear = year + (year / 4)
        where year = (read (drop 2 (show fullyear)) :: Float)

monthOffset :: Float -> Float
monthOffset month = mod' (3.4 + ((mod' (month - 3) 12) * 2.6)) 7

dayOffset :: Float -> Float
dayOffset day = mod' day 7

dayOfWeek :: Float -> Float -> Float -> Int 
dayOfWeek day month year = truncate (mod' ((centuryOffset year) + (yearOffset year) + (monthOffset month) + (dayOffset day)) 7)


weekdays = ["Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday", "Sunday"]
months = [("jan", 31), ("feb", 2829), ("mar", 31), ("apr", 30), ("may", 31), ("june", 30), ("july", 31), ("aug", 31), ("sept", 30), ("oct", 31), ("nov", 30), ("dec", 31)]

main = do
  --putStr (weekdays !! (dayOfWeek 1 1 1900))
  putStr (show (centuryOffset 2200))
 