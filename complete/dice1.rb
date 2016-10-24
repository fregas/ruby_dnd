

puts "Enter the number of dice:"
dice = gets.chomp.to_i

puts "Enter the number of sides on each die:"
sides = gets.chomp.to_i

for i in 1..dice
	result = 1 + rand(sides)
	puts result
end


