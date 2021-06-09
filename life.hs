import Test.HUnit

next :: Bool -> Int -> Bool
next wasAlive neighbors = neighbors == 2 || neighbors == 3 || False

tests = TestList 
    [
        TestCase (assertEqual "dead cell with no friends stay dead" (False) (next False 0) ),
        TestCase (assertEqual "live cell with no friends becomes dead" (False) (next True 0) ),
        TestCase (assertEqual "live cell with two friends stay alive" (True) (next True 2) ),
        TestCase (assertEqual "live cell with three friends stay alive" (True) (next True 3) ),
        TestCase (assertEqual "live cell with more than three friends dies" (False) (next True 4) ),
        TestCase (assertEqual "live cell with more less than two friends dies of loneliness" (False) (next True 1) ),
        TestCase (assertEqual "a dead cell with exactly three friends comes to life" (True) (next False 3) )
    ]

main = do runTestTT tests