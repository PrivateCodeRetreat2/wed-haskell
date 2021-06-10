import Test.HUnit

aFunction :: Bool -> Bool
aFunction input = True

tests = TestList 
    [
        TestCase (assertEqual "it fails" (False) (aFunction True) )
    ]

main = do runTestTT tests