# frozen_string_literal: true

# A Pythagorean triplet is a set of three natural numbers, a < b < c, for
# which, a^2 + b^2 = c^2.
# For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

# There exists exactly one Pythagorean triplet for which a + b + c = 1000
# Find the product abc.

# a = m^2 - n^2
# b = 2 * m * n
# c = m^2 + n^2

def pythagorean_triplet(m, n)
  [
    m * m - n * n,
    2 * m * n,
    m * m + n * n
  ]
end

def special_triplet
  m = 2
  loop do
    (1...m).each do |n|
      triplet = pythagorean_triplet(m, n)
      return triplet if triplet.sum == 1000
    end
    m += 1
  end
end

puts special_triplet.inject :*
