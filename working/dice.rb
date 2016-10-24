
# this is a method, a piece of code to be reused later
def gets_int(message)
	puts message
	gets.chomp!.to_i
end

# we "call" the method with the message parameter and store the results in the dice variable
dice = gets_int( "Enter the number of dice:")

# and we do the same with sides
sides = gets_int "Enter the number of sides on each die:"

for i in 1..dice
	result = 1 + rand(sides)
	puts result
end



