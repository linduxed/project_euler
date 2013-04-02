{-
 - The following iterative sequence is defined for the set of positive integers:
 -
 - n -> n/2    (n is even)
 - n -> 3n + 1 (n is odd)
 -
 - Using the rule above and starting with 13, we generate the following sequence:
 - 13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1
 -
 - It can be seen that this sequence (starting at 13 and finishing at 1)
 - contains 10 terms. Although it has not been proved yet (Collatz Problem), it
 - is thought that all starting numbers finish at 1.
 -
 - Which starting number, under one million, produces the longest chain?
 - NOTE: Once the chain starts the terms are allowed to go above one million.
 -}

import qualified Data.Map as Map
import Data.Maybe
import Data.List (maximumBy)
import Data.Ord (comparing)

main :: IO ()
main = print problem14

problem14 :: Integer
problem14 = accLoop 1 emptyCache where
    emptyCache :: Map.Map Integer [Integer]
    emptyCache = Map.fromList []

    accLoop startNum sequenceCache
        | startNum < 1 || startNum > 999999 = head . maximumBy (comparing length) $ Map.elems sequenceCache
        | otherwise                         = accLoop (startNum + 1) (cacheCollatz startNum sequenceCache)

cacheCollatz :: Integer -> Map.Map Integer [Integer] -> Map.Map Integer [Integer]
cacheCollatz x sequenceCache = Map.insert x (collatz x sequenceCache) sequenceCache where
    collatz y cache = fromMaybe nonCachedSequence checkCache where
        checkCache = Map.lookup y cache
        nonCachedSequence
            | y <= 1    = [1]
            | even y    = y : collatz (y `div` 2) cache
            | otherwise = y : collatz (3*y + 1)   cache
