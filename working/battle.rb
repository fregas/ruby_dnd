require 'colorize'

module World
	PAUSE = 0.8

	# allows us to call these functions without defining them as self.roll_die	
	module_function
	
	def roll_die(sides)
		result = 1 + rand(sides)
	end

	def fight!(character1, character2)
		while true
			character1.attack character2
			character2.attack character1

			show_status_of([character1, character2])
			break if character1.dead? or character2.dead?  #fight is over
			puts "-" * 20
		end
	end

	def show_status_of(characters) 
		characters.each do |character|
			puts "#{character.name}: #{character.hit_points} Hp"
			puts "#{character.name} is DEAD".red if character.dead?
		end
	end
end


# a class holds data plus behavior (methods) in one structure
class Character
	# accessors expose data
	attr_accessor :attack_score, :weapon, :damage, :ac, :name, :hit_points

	def initialize(name)
		# we're using the "@name" instance variable
		@name = name
	end

	# separate attack from attack score.  one holds a value (a variable)
	# the other performs behavior (does the attacking)
	def attack(enemy_character)
		puts "#{name} will attack #{enemy_character.name}:"

		# pause the action for 2 seconds for "drama"
		sleep(World::PAUSE)

		dice_roll = World.roll_die(20) + self.attack_score 

		if dice_roll >= enemy_character.ac 
			current_damage = World.roll_die(self.damage)
			enemy_character.hit_points = enemy_character.hit_points - current_damage
			puts "hits! with #{self.weapon} for #{current_damage}".red
		else
			puts "misses".green
		end
	end

	def alive?
		hit_points > 0
	end

	def dead?
		not alive?
	end
end

# we "instantiate" characters, and each character object has its own variables/methods
irint = Character.new("Irint")
irint.attack_score = 6
irint.ac = 14
irint.weapon = :sword
irint.damage = 8
irint.hit_points = 20

goblin = Character.new("Steroid Goblin")
goblin.attack_score = 3
goblin.ac = 12
goblin.weapon = :dagger
goblin.damage = 6
goblin.hit_points = 20 #mega hit points for a goblin!

# notice I dont' have to instantiate World.  module methods can run without instantiating.
World.fight! irint, goblin



