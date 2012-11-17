{-
 - The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
 - Find the sum of all the primes below two million.
 -}

sumPrimes :: Integer -> Integer
sumPrimes maxPrime = sum $ takeWhile (< maxPrime) primes

primes :: [Integer]
primes = 2: 3: sieve (tail primes) [5,7..] where
    sieve (p:ps) xs = h ++ sieve ps [x | x <- t, rem x p /= 0] where
        (h,~(_:t)) = span(< p*p) xs
