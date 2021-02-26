hello :: String -> String
hello s = "Hello " ++ s ++ " !!"

main :: IO()
main = do
    let str = "tatatakky"
    putStrLn $ hello str

