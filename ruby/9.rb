# A Pythagorean triplet is a set of three natural numbers, a < b < c, for
# which, a^2 + b^2 = c^2
#
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 52.
#
# There exists exactly one Pythagorean triplet for which a + b + c = 1000.
# Find the product abc.


# Since a < b < c, a can't be larger than a third of 1000 as that would force
# b and c to equal 334 and 335. b can't be more than half of 1000.
def py_triplet(max=1000)
  (1..max/3).each do |a|
    (a+1..max/2).each do |b|
      c = max - a - b
      if a < b and b < c
        return [a, b, c] if a**2 + b**2 == c**2
      end
    end
  end
end

puts py_triplet.reduce(&:*)
