# frozen_string_literal: true

# TODO:
# check out the palindrome formula
# The palindrome can be written as
# 11(9091a + 910b + 100c) = mn;
# a,b & c being 1 digit integers and m & n being 3 digit integers.
# Let 11 * 10 < m < 11 * 90;

# A palindromic number reads the same both ways. The largest palindrome made from the product of
# two 2-digit numbers is 9009 = 91 × 99.
# Find the largest palindrome made from the product of two 3-digit numbers.

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

puts palindromes((900..999)).max
