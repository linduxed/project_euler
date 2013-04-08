{-
 - Starting in the top left corner of a 2×2 grid, following the edges and only
 - being able to move to the right and down, there are exactly 6 routes to the
 - bottom right corner.
 -
 - How many such routes are there through a 20×20 grid?
 -}
data Direction = DRight | DDown deriving (Show, Eq)
type Position  = (Integer, Integer)
type Grid      = (Integer, Integer)

problem15 :: Int
problem15 = length $ pickAllPaths (20, 20)

pickAllPaths :: Grid -> [[Direction]]
pickAllPaths gridSize = branchLoop (availableDirections start) [] start
  where
    start = (0, 0)

    branchLoop :: [Direction] -> [Direction] -> Position -> [[Direction]]
    branchLoop [] path _ = [path]
    branchLoop directions currPath currPos = concatMap branchHelper directions
      where
        branchHelper x = branchLoop (availableDirections (nextPos x)) (x:currPath) (nextPos x)
        nextPos = oneStep currPos

    availableDirections position
        | position     == gridSize     = []       -- Reached bottom-right corner.
        | fst position == fst gridSize = [DDown]  -- Reached right border.
        | snd position == snd gridSize = [DRight] -- Reached bottom.
        | otherwise                    = [DRight, DDown]

oneStep :: Position -> Direction -> Position
oneStep (x, y) nextPosirection
    | nextPosirection == DRight = (x+1, y  )
    | otherwise               = (x  , y+1)
