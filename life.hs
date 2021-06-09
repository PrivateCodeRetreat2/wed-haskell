import Test.HUnit

next wasAlive neighbors = wasAlive || False

tests = TestList 
    [
        TestCase (assertEqual "dead cell with no friends stay dead" (False) (next False 0) )
    ]

main = do runTestTT tests