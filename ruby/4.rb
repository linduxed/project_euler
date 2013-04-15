# A palindromic number reads the same both ways. The largest palindrome made
# from the product of two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

def is_palindrome?(number)
  number.to_s == number.to_s.reverse
end

def largest_palindrome
  largest = 0

  100.upto(999) do |i|
    i.upto(999) do |j|
      if is_palindrome?(i*j) and i*j > largest
        largest = i*j
      end
    end
  end

  return largest
end

puts largest_palindrome
