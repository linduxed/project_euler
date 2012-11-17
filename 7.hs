{-
 - By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see
 - that the 6th prime is 13.
 - What is the 10001st prime number?
 -}

nthPrime :: Integer -> Integer
nthPrime n = last $ take (fromIntegral n) primes

primes :: [Integer]
primes = 2: 3: sieve (tail primes) [5,7..] where
    sieve (p:ps) xs = h ++ sieve ps [x | x <- t, rem x p /= 0] where
        (h,~(_:t)) = span(< p*p) xs
