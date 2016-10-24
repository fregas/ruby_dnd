
# Ruby and D&D

## Assumptions and prerequisites:
* you are computer literate and know how to manage files and folders, etc.
* you can type fairly accurately and quickly
* you already installed ruby and a text editor (not word)
* it would help a lot if you know your way around a terminal
* who has never been to rubyftw before?
* how many have played D&D or RPGs?
* how many people have programmed before?
* how many people have played w/ ruby?

## Intro
* irb
* variables, data types, puts, arrays with first, last, indexers, strings and adding them together, quotes.  

## Hail World!
* programs, input, numbers, everything is an object, output, variables, data types, comments, string interpolation, gems, loops
* hail_world1 - puts
* hail_world2 
  - let's add some input and variables so that the name can be chosen
* hail_world3 
  - lets make it repeat the hail a number of times and we'll introduce loops and data types.  
  - We can avoid "adding" strings and variables together with interpolation.  
  - we can also add comments.   
* hail_world4 
  - now lets change the color.  
  - We'll include a gem and require it.  
  - show error when gem is missing.  Then show it fixed.  
  - In a production application, we should use bundler to manage gems for a project.  
  - Otherwise the next guy won't necessarily have the same gems installed.  
  - Colorize changes the string, so we only want to use it when PUTSing.  

## Dice
* rand, methods, refactoring, debugging
* dice1.rb 
  - D&D uses dice to resolve conflict.  
  - Can we emulate a dice roll?  Multipe  die?  
  - We need the rand function will will give us a random value between 0 and a target #.  
  - We'll add + 1 because behind the scenes rand is getting a random decimal between 0 and our number, and then rounding down.  
* dice2.rb 
  - we have some repetition in getting the input from the user and converting to an integer.  
  - Lets use a method to reuse code without copy and paste.  
* dice3.rb 
  - we can put roll dice into a method if we want as well. 
  - We sort of have our own language for describing what we're doing.  DSL.  
* dice4.rb 
  -  D&D has this concept of critical hits, when the maximum roll is reached (usually a d20 but other games might be a d6 or something.)  
  - Lets put that in another color.  
  - We can do that with an "if/else" statement.  You'll notice parenthesis are optional as long as you don't need to nest multiple method calls in a certain order.  
  - We'll get an error!
* dice5.rb 
  - we can fix that error by converting our result which is an integer, to a string using the "to_s" method.  
  - Then we can colorize that string.  
  - We'll also separate the final results.  
  - "The dot":  The dots in ruby like many languages, signify method calls.  
  - We can chain them together to ask an object for something, get that back, ask that new object for something.  
  - method calls = message passing.  
  - We don't know what or how the object is doing its work.  
  - We just are asking it for something.  we might use object.send.  


## battle
* if statements, classes, objects, modules, constants, constructors, symbols
* battle1 
  - so what we want is a way to simulate to character in battle.  
  - Each will have an attack bonus and an armor class or AC.  
  - We then need to roll a single dice (a d20) to see one character hits the other.  
  - if the die roll plus the attack bonus is greater than or equal to the AC fo the enemy, that's a hit. 
  - My son's character is an elf named Irint he's played for 9 years.  The first thing he fought was a goblin.  So lets see if Irint can hit a goblin.   
* battle2 
  - irint is attacking the goblin, but now we want to have the goblin fight back.  We can copy and paste that if we desire.  
* battle3 
  - we may also want to show how much damage the goblin or irint are doing to each other and using what weapons?  
  - We can add variales for each of those stats, one set of variables for irint and another for the goblin and add those in both places in our attack code.  
  - But we have to do this twice. Hmmmm.  We have a set of repetive variables.  
  - Irint has attack, ac, weapon and damage and so does the goblin.  But also, irint has behavior to attack and so does the goblin.  
  - Could we have some way to hold common data and behavior in one thing for any characters whether they are a goblin and elf or somethign else?
* battle4 
  - Turns out we can.  We can create a class, which is like a blueprint for our data.  
  - In D&D, we might have multiple character sheets which is a standard form about the character.  
  - The structure of the character sheets are the same: name, ac, damage, etc.  The data inside is different.  
  - A class is like the structure of the character sheet, plus some behavior (methods.)  Each character written on a sheet is an instance.  
  - We can mimic this in code.  We can put the common variables: ac, attack score, damage, etc. in the class
  - Then we create instances, vary it for the goblin and Irint.  
  - We can also give them each the ability to attack an enemy.  
  - Then we tell irint to attack the goblin and the goblin to attack irint.  
  - variables in a class are not available outside (encapsulation), but unlike other variables, are available to every method.   
  - to reduce coupling and create abstraction.  (There are ways around this but don't use them.) 
  - You may also hear about inheritance and polymorphism, but OO is mostly IMHO about data + behavior in one definition.  
  - Classes are one way to get that done.
* battle5 
  - D&D has this concepts of "rounds".  
  - THe character are not just going to attack once, but multiple times to emulate a dual.  
  - We need a method to have the characters attack each other back and forth, for as many rounds as we want.  
  - We also might want to slow things down for "drama", so we have time to see each attack and its result (hit or miss.) 
  - For this we'll use the sleep method.  
  - Finally, lets remove the name getter and setter methods, painful in other langs, like java, in having to do this by hand.  
* battle6 
  - having "global" methods is generally a bad idea.  
  - You don't want your methods and variables conflicting with other methods and variables, 
  - but you may not need the overhead of a class and objects.  
  - You may just want a named "bucket" to put utility methods in.  
  - With Ruby, can do this with "modules".  
  - Modules are used in a variety of ways, but in this case, its just a namespace for our functions, 
  - so we dont' clutter things ups or conflict with anyone else.  
  - The functionality will be the same.  
  - We'll add the World module, some gaming frameworks have in place 
  - change the places where we  are calling roll_die or fight! to World.roll_die/fight.  
  - Note that we don't have to use ".new" on the module.
* battle7 
  - no RPG would be complete without "hit points" to track damage and health of a character.  
  - We need a new attribute to expose hitpoints outside of our character objects.  
  - We also want the attack method to subtract damage IF we hit.  
  - We'll roll a separate dice for the damage of the weapon, so we get to reuse the World.roll_die method.  
  - We also modify our objects to specify Irint and goblin's hit points.  Irint is a badass, so he has a lot more.  
* battle8 
  - fights in D&D don't usually end after a set # of rounds.  
  - Typically, they go on until one side is dead or unconscious.  
  - The battle should continue indefinitely until one side or the other loses all their hit points.  
  - We can add methods for "dead" or "alive" in ruby, using the question mark in the method name to signify that it will be true or false.  
  - We'll replace our for loop with a never-ending while loop, which we'll only "break" out of if someone's hitpoitns are at or below zero.  
  - Lets also clean up some repetitive code.  
  - Since this fight might go on longer, we might like to change our sleep.  
  - This is a good opportunity to use a constant, an unchanging variable to hold and document special values.  its a bad idea to "hard code" a number like this 
  - Finally, lets give our goblin more hit points, to see the fight last a few more rounds.  He could be a steroid goblin.  

