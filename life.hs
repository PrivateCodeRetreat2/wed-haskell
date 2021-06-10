import Test.HUnit

type World = Int -> Int -> Bool

evolve :: World -> World
evolve worldBefore x y = 
    -- ((worldBefore 1 0 && 1 || 0) + (worldBefore 0 1 ? 1 : 0) + (worldBefore 0 1 ? 1 : 0)) == 1
    countNeighbours worldBefore x y == 3 || countNeighbours worldBefore x y == 2 && worldBefore x y

countNeighbours:: World -> Int -> Int -> Int
countNeighbours worldBefore x y = sum (map (\x -> if x then 1 else 0) [worldBefore 1 0, worldBefore 0 1, worldBefore 0 (-1)])

emptyWorld x y = False
lonelyCell x y = (x == 0) && (y == 0)
horizontalLine x y = y == 0
verticalLine x y = x == 0

shiftDown :: World -> World
shiftDown world x y = world x (y + 1)

tests = TestList 
    [
        TestCase (assertEqual "cell in empty world evolves to dead" (False) (evolve emptyWorld 0 0) ),
        TestCase (assertEqual "lonely cell dies" (False) (evolve lonelyCell 0 0)),
        TestCase (assertEqual "cell with a neighbour to the left and right" (True) (evolve horizontalLine 0 0)),
        TestCase (assertEqual "cell with neighbours above and below" (True) (evolve verticalLine 0 0)),
        TestCase (assertEqual "cell with three neighbours spawns" (True) (evolve (shiftDown horizontalLine) 0 0))
    ]

main = do runTestTT tests