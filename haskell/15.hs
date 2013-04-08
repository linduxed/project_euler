{-
 - Starting in the top left corner of a 2×2 grid, following the edges and only
 - being able to move to the right and down, there are exactly 6 routes to the
 - bottom right corner.
 -
 - How many such routes are there through a 20×20 grid?
 -}

{-
 - Upon inspection, the amount of paths is directly proportional to the center
 - values of the odd numbered rows in Pascal's Triangle:
 -
 -             1
 -           1   1
 -         1   2   1         <- 1x1 grid has 2 paths
 -       1   3   3   1
 -     1   4   6   4   1     <- 2x2 grid has 6 paths
 -   1   5   10  10  5   1
 - 1   6   15  20  15  6   1 <- 3x3 grid has 20 paths
 -
 - Calculating the triangle and using these values is far less expensive than
 - traversing all the paths.
 -
 - Another way of seeing it is as the binomial "40 choose 20".
 -}
problem15 :: Int
problem15 = triangleValue $ gridSizeToTriangleRow 20

-- There should be an addition of one at the end here, but since list positions
-- start at 0, this addition is omitted to compensate.
gridSizeToTriangleRow :: Int -> Int
gridSizeToTriangleRow size = size * 2

triangleValue :: Int -> Int
triangleValue rowNumber = pascal !! rowNumber !! (rowNumber `div` 2)

pascal :: [[Int]]
pascal = iterate f [1]
  where
    f xs = zipWith (+) (0:xs) (xs ++ [0])
