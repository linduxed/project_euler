# If we list all the natural numbers below 10 that are multiples of 3 or 5, we
# get 3, 5, 6 and 9. The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

def multiples(factors, max)
  1.upto(max).select { |i| factors.any? { |f| i % f == 0 } }
end

puts "#{multiples([3,5], 999).inject { |sum, x| sum + x }}"
