{-
 - A palindromic number reads the same both ways. The largest palindrome made
 - from the product of two 2-digit numbers is 9009 = 91 × 99.
 - Find the largest palindrome made from the product of two 3-digit numbers.
 -}

largest3DigitProductPalindrome :: Integer
largest3DigitProductPalindrome = maximum $ filter isPalindrome products where
    isPalindrome x = reverse number == number where
        number = show x
    products       = [ a * b | a <- [100..999], b <- [100..999] ]
