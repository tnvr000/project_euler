# frozen_string_literal: true

# The sequence of triangle numbers is generated by adding the natural
# numbers. So the 7th triangle number would be
#   1 + 2 + 3 + 4 + 5 + 6 + 7 = 28.
# The first ten terms would be:
#   1, 3, 6, 10, 15, 21, 28, 36, 45, 55, ...

# Let us list the factors of the first seven triangle numbers:

#    1: 1
#    3: 1,3
#    6: 1,2,3,6
#   10: 1,2,5,10
#   15: 1,3,5,15
#   21: 1,3,7,21
#   28: 1,2,4,7,14,28

# We can see that 28 is the first triangle number to have over five
# divisors.
# What is the value of the first triangle number to have over five
# hundred divisors?

def triangular_number(index)
  (index * (index + 1)) / 2
end

def factors_count(number)
  count = 0
  limit = Math.sqrt(number)
  (1...limit.ceil).each do |divisor|
    count += 1 if (number % divisor).zero?
  end
  (number % limit).zero? ? count * 2 + 1 : count * 2
end

def required_triangular_number_index(factor_limit)
  index = 1
  loop do
    return index if factors_count(triangular_number(index)) > factor_limit

    index += 1
  end
end

puts triangular_number(required_triangular_number_index(500))
