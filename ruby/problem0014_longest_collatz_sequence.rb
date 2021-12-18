# frozen_string_literal: true

# The following iterative sequence is defined for the set of positive
# integers:
#   n → n/2 (n is even)
#   n → 3n + 1 (n is odd)
# Using the rule above and starting with 13, we generate the following
# sequence:
#   13 -> 40 -> 20 -> 10 -> 5 -> 16 -> 8 -> 4 -> 2 -> 1
# It can be seen that this sequence (starting at 13 and finishing at 1)
# contains 10 terms. Although it has not been proved yet, it is thought
# that all starting numbers finish at 1.

# Which starting number, under one million, produces the longest chain?
# NOTE: Once the chain starts the terms are allowed to go above one
# million.

def next_collatz_number(number)
  number.even? ? number / 2 : 3 * number + 1
end

def collatz_sequence(number)
  sequence = [number]
  while number > 1
    number = next_collatz_number number
    sequence << number
  end
  sequence
end

def collatz_sequence_length(number)
  count = 1
  while number > 1
    number = next_collatz_number(number)
    count += 1
  end
  count
end

def longest_collatz_sequence(limit)
  longest_collatz_sequence_number = 0
  longest_collatz_sequence_count = 0
  1.upto(limit) do |number|
    collatz_sequence_count = collatz_sequence_length(number)
    if collatz_sequence_count > longest_collatz_sequence_count
      longest_collatz_sequence_count = collatz_sequence_count
      longest_collatz_sequence_number = number
    end
  end
  longest_collatz_sequence_number
end

puts collatz_sequence(longest_collatz_sequence(1_000_000)).join(' -> ')
