# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143 ?

def primes_up_to(max)
  primes = [1,2]
  pool = (3..max).step(2).to_a

  while (primes.last**2 < max)
    primes.push(pool.first)
    pool = pool.reject { |i| i % pool.first == 0 }
  end

  return primes + pool
end

def prime_factors(number)
  primes = primes_up_to(number)
  primes_smaller_than_half_of_number = primes.select { |i| i*2 <= number }
  factors = primes_smaller_than_half_of_number.select { |i| number % i == 0 }

  return factors
end

puts "#{prime_factors(600851475143).max}"
