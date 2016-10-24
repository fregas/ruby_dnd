require 'colorize'

# copy and paste roll dice
def roll_die(sides)
	result = 1 + rand(sides)
end

irint_attack = 6
irint_ac = 14
irint_weapon = :sword
irint_damage = 8

goblin_attack = 3
goblin_ac = 12
goblin_weapon = :dagger
goblin_damage = 6

puts "Irint will attack the goblin:"

dice_roll = roll_die(20) + irint_attack 

if dice_roll >= goblin_ac
	damage = roll_die(irint_damage)
	puts "hits! with #{irint_weapon} for #{damage}".red
else
	puts "misses".green
end


puts "Goblin will attack Irint:"

dice_roll = roll_die(20) + goblin_attack 

if dice_roll >= irint_ac 
	damage = roll_die(goblin_damage)
	puts "hits! with #{goblin_weapon} for #{damage}".red
else
	puts "misses".green
end

