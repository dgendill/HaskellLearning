import System.IO

main = do
	putStrLn "Please enter your name: "
	hFlush stdout
	name <- getLine
	putStrLn ("Hello, " ++ name ++ " doubled something.")