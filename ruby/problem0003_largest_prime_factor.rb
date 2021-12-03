# frozen_string_literal: true

# The prime factors of 13195 are 5, 7, 13 and 29.
# What is the largest prime factor of the number 600851475143?

require 'prime'

number = 600_851_475_143
prime_numbers = Prime.take_while { |p| p < Math.sqrt(number).to_i }

prime_numbers.reverse_each do |i|
  if (number % i).zero?
    puts i
    break
  end
end
