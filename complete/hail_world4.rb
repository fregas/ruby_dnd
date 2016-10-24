require 'colorize'

puts "What is thy name?"
name = gets.chomp!

puts "How many times shalt thou be hailed?"
times = gets.chomp!.to_i

puts "What is thy favorite color?"
color = gets.chomp!

for i in 1..times 
	puts "Hail #{name}! #{i}".send(color)
end


