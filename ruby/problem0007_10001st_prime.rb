# frozen_string_literal: true

# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can
# see that the 6th prime is 13. What is the 10 001st prime number?

require 'prime'
require 'benchmark'

def prime?(number)
  2.upto(Math.sqrt(number).to_i) do |divisor|
    return false if (number % divisor).zero?
  end
  true
end

def prime100012
  number = 3
  counter = 1

  loop do
    counter += 1 if prime?(number)
    break if counter > 10_000

    number += 2
  end
  number
end

def prime10001
  Prime.first(10_001).last
end

Benchmark.bmbm do |x|
  x.report('Prime generator') { prime10001 }
  x.report('Prime brute') { prime100012 }
end

puts prime10001
puts prime100012
