# frozen_string_literal: true

# The palindrome can be written as
# 11(9091a + 910b + 100c)
# 0 < a <= 9
# 0 <= b, c <=9

# A palindromic number reads the same both ways. The largest palindrome made from the product of
# two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

require 'benchmark'

# add custom methods to integer class
class Integer
  # returns true if the number read same both forward and backward
  def palindrome?
    self == reverse
  end

  # returns reverse of the self
  def reverse
    temp = self
    reverse = 0
    while temp != 0
      digit = temp % 10
      reverse = reverse * 10 + digit
      temp /= 10
    end
    reverse
  end
end

# returns all palindromes made from product of two number in given range
def palindromes(range)
  palindromes = []
  range.reverse_each do |i|
    range.reverse_each do |j|
      number = i * j
      palindromes << number if number.palindrome?
    end
  end
  palindromes
end

def largest_palindrome1
  palindromes((900..999)).max
end

def largest_palindrome2
  (0..9).reverse_each do |b|
    (0..9).reverse_each do |c|
      palindrome = 11 * (81_819 + (910 * b) + (100 * c)) # 81_819 = 9019 * 9 because a = 9
      (900..999).reverse_each do |divisor|
        return palindrome if (palindrome % divisor).zero? && (palindrome / divisor) <= 999
      end
    end
  end
end

Benchmark.bmbm do |x|
  x.report('brute') { largest_palindrome1 }
  x.report('formula') { largest_palindrome2 }
end

puts largest_palindrome2
