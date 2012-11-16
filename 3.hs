{-
 - The prime factors of 13195 are 5, 7, 13 and 29.
 - What is the largest prime factor of the number 600851475143 ?
 -}

pFactors :: Integer -> [Integer]
pFactors maxVal = filter ((== 0) . (maxVal `mod`)) $ allPrimeFactors maxVal

-- Generates all primes below the square root of maxVal.
allPrimeFactors :: Integer -> [Integer]
allPrimeFactors maxVal = takeWhile ((< maxVal) . (\x -> x*x)) primes

-- Fast prime number generation taken from
-- http://www.haskell.org/haskellwiki/Talk:Prime_numbers
primes :: [Integer]
primes = 2: 3: sieve (tail primes) [5,7..] where
    sieve (p:ps) xs = h ++ sieve ps [x | x <- t, rem x p /= 0] where
        (h,~(_:t)) = span(< p*p) xs
