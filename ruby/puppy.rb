# Puppy class description

# Characteristics:
#   goofy_level: 9
#   main_color: black
#   name: Buddy
#   has_owner: true
#   pure_bred: false
#   likes_kibble: true
#   tricks_mastery_level:
#       sit: 3
#       down: 2
#       stay: 1

# Behaviors:
#   eat
#   bark
#   sleep
#   whine    

# define Puppy class

class Puppy
  
  def fetch(toy)
    puts "I brought back the #{toy}!"     
    toy
  end

  
  def speak(num_barks)
  # speak method - takes an integer and woofs that many times
  # add carriage return to last woof
    bark_count = 0
    while bark_count < (num_barks - 1)
      print "Woof! "
      bark_count += 1
    end
    # one last woof with carriage return, as long as there was at least one woof
    if num_barks > 0
      puts "Woof!"
    end
  end

  def roll_over
    # just print *rolls over*
    puts "*rolls over*"
  end 

  def dog_years(human_years)
    # convert human years to dog years by dividing by 7
    return human_years / 7
  end

  def eat(food_to_eat)
    puts "I just ate #{food_to_eat}!"
  end

  def initialize
    puts "Initializing new puppy instance..."
  end


end

# test puppy behaviors
# note: it is assumed that the user enters valid input.
# in real life, error checking would be present
trix = Puppy.new
trix.fetch('biscuit')
trix.speak(0)
trix.speak(1)
trix.speak(3)
trix.roll_over
trix.dog_years(50)
trix.eat('kibble')
