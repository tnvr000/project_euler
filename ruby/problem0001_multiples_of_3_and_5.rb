# frozen_string_literal: true

# If we list all the natural numbers below 10 that are multiples of 3 or 5, we get 3, 5, 6 and 9.
# The sum of these multiples is 23.
# Find the sum of all the multiples of 3 or 5 below 1000.

sum1 = 0
(1...1000).each do |number|
  sum1 += number if (number % 3).zero? || (number % 5).zero?
end
puts sum1

sum2 = (1...1000).select do |number|
  (number % 3).zero? || (number % 5).zero?
end.sum

puts sum2
