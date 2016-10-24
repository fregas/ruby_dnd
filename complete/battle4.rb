require 'colorize'

# copy and paste roll dice
def roll_die(sides)
	result = 1 + rand(sides)
end


# a class holds data plus behavior (methods) in one structure
class Character
	# accessors expose data
	attr_accessor :attack_score, :weapon, :damage, :ac 

	def initialize(name)
		# we're using the "@name" instance variable
		@name = name
	end

	def name
		@name
	end

	def name=(value)
		@name = value
	end

	# separate attack from attack score.  one holds a value (a variable)
	# the other performs behavior (does the attacking)
	def attack(enemy_character)
		puts "#{name} will attack #{enemy_character.name}:"

		dice_roll = roll_die(20) + self.attack_score 

		if dice_roll >= enemy_character.ac 
			current_damage = roll_die(self.damage)
			puts "hits! with #{self.weapon} for #{current_damage}".red
		else
			puts "misses".green
		end
	end
end

# we "instantiate" characters, and each character object has its own variables/methods
irint = Character.new("Irint")
irint.attack_score = 6
irint.ac = 14
irint.weapon = :sword
irint.damage = 8

goblin = Character.new("Goblin")
goblin.attack_score = 3
goblin.ac = 12
goblin.weapon = :dagger
goblin.damage = 6

irint.attack goblin
goblin.attack irint

