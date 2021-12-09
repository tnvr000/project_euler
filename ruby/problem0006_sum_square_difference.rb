# frozen_string_literal: true

# The sum of the squares of the first ten natural numbers is,
#   1^2 + 2^2 + 3^2 + 4^2 + .... + 10^2 = 385

# The square of the sum of the first ten natural numbers is,
#   (1 + 2 + 3 + 4 + .... + 10)^2 = 3025

# Hence the difference between the sum of the squares of the first ten
# natural numbers and the square of the sum is
#   3025 - 385 = 2640

# Find the difference between the sum of the squares of the first one
# hundred natural numbers and the square of the sum.

n = 100
square_of_sum = ((n * (n + 1)) / 2) * ((n * (n + 1)) / 2)
sum_of_square = (n * (n + 1) * (2 * n + 1) / 6)

difference = square_of_sum - sum_of_square

puts difference
