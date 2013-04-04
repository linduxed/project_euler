# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

require "prime"

def prime_factors(number)
  primes = Prime.each(Math.sqrt(number).truncate).to_a
  primes_smaller_than_half_of_number = primes.select { |i| i*2 <= number }
  factors = primes_smaller_than_half_of_number.select { |i| number % i == 0 }

  return factors
end

puts "#{prime_factors(600851475143).max}"
