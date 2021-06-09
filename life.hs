import Test.HUnit

next wasAlive = wasAlive || False

tests = TestList 
    [
        TestCase (assertEqual "everything is always dead" (False) (next True) )
    ]

main = do runTestTT tests