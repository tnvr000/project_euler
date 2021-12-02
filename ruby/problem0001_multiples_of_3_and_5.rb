# Sum of all the numbers that are multiples of 3 or 5 below 1000
sum =  0
(1...1000).each do |number|
	sum += number if number % 3 == 0 || number % 5 == 0
end
puts sum
# testing git somethings wrong
