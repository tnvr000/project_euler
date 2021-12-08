# frozen_string_literal: true

# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any
# remainder. What is the smallest positive number that is evenly divisible by all of the numbers
# from 1 to 20?

require 'benchmark'

def smallest_multiple1
  increment = 1
  multiple = 1
  1.upto(20) do |divisor|
    loop do
      if (multiple % divisor).zero?
        increment = multiple
        break
      else
        multiple += increment
      end
    end
  end
  multiple
end

def smallest_multiple2
  multiple = 1
  1.upto(20) do |number|
    multiple = multiple.lcm(number)
  end
  multiple
end

Benchmark.bmbm do |x|
  x.report('increment') { smallest_multiple1 }
  x.report('lcm') { smallest_multiple2 }
end

puts smallest_multiple2
