require 'colorize'

# copy and paste roll dice
def roll_die(sides)
	result = 1 + rand(sides)
end

irint_attack = 6
irint_ac = 14

goblin_attack = 3
goblin_ac = 12

puts "Irint will attack the goblin:"

dice_roll = roll_die(20) + irint_attack 

if dice_roll >= goblin_ac
	puts "hits!".red
else
	puts "misses".green
end



