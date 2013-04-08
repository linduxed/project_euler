{-
 - Starting in the top left corner of a 2×2 grid, following the edges and only
 - being able to move to the right and down, there are exactly 6 routes to the
 - bottom right corner.
 -
 - How many such routes are there through a 20×20 grid?
 -}

problem15 :: Integer
problem15 = 40 `choose` 20

choose :: Integer -> Integer -> Integer
choose a b = fac a `div` (fac b * fac b)
  where
    fac x = product [1..x]
