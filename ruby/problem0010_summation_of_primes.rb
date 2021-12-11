# frozen_string_literal: true

# The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.

# Find the sum of all the primes below two million.

require('prime')
require('benchmark')

def summation_of_prime1(limit)
  (Prime.take_while { |p| p < limit }).sum
end

def prime?(number)
  2.upto(Math.sqrt(number).to_i) do |divisor|
    return false if (number % divisor).zero?
  end
  true
end

def summation_of_prime2(limit)
  sum = 0
  2.upto(limit) do |number|
    sum += number if prime?(number)
  end
  sum
end

limit = 2_000_000

Benchmark.bmbm do |x|
  x.report('in-built method') { summation_of_prime1(limit) }
  x.report('custom method') { summation_of_prime2(limit) }
end

puts summation_of_prime1(limit)
