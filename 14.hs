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

problem14 :: Integer
problem14 = accLoop 1 0 0 where
    accLoop startNum longestSequenceNum longestSequenceLength
        | startNum < 1 || startNum > 999999       = longestSequenceNum
        | sequenceLength >= longestSequenceLength = accLoop (startNum + 1) startNum           sequenceLength
        | otherwise                               = accLoop (startNum + 1) longestSequenceNum longestSequenceLength
        where
            sequenceLength = length $ collatz startNum

collatz :: Integer -> [Integer]
collatz x = x : iter x where
    iter y
        | y <= 1    = []
        | even y    = collatz (y `div` 2)
        | otherwise = collatz (3*y + 1)
