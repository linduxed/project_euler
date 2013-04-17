# A Pythagorean triplet is a set of three natural numbers, a < b < c, for
# which, a^2 + b^2 = c^2
#
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 52.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.


# Since a < b < c, a can't be larger than 333 as that would force b to be at
# least 334 and c 335. This would cause the sum to exceed 1000.
# b can't be higher than 500 since c would need to be 501.
def py_triplet
  (1..333).each do |a|
    (a+1..500).each do |b|
      c = 1000 - a - b
      if a < b and b < c
        return [a, b, c] if a**2 + b**2 == c**2
      end
    end
  end
end

puts py_triplet.reduce(&:*)
