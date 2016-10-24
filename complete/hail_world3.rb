
puts "What is thy name?"
name = gets.chomp!

puts "How many times shalt thou be hailed?"
times = gets.chomp!
times = times.to_i

# this is a comment.  It does nothing except as a note to the programmer
# below is a "for" loop.  We will repeat the hail for however many times 
# the user asks us to in the "times" variable above
for i in 1..times 
	puts "Hail #{name}! #{i}"
end

