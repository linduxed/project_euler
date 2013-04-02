module Primes where

-- Fast prime number generation taken from
-- http://www.haskell.org/haskellwiki/Talk:Prime_numbers
primes :: [Integer]
primes = 2: 3: sieve (tail primes) [5,7..] where
    sieve (p:ps) xs = h ++ sieve ps [x | x <- t, rem x p /= 0] where
        (h,~(_:t)) = span(< p*p) xs

primeFactors :: Integer -> [Integer]
primeFactors maxVal = filter ((== 0) . (maxVal `mod`)) $ halfOfPrimes maxVal where
    halfOfPrimes maxVal' = takeWhile ((<= maxVal') . (*2)) primes
