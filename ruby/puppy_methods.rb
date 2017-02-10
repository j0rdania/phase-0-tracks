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

  def initializee
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


# ferry rider class
class Ferry_rider
  def initialize (rider_name)
    # this initialize method will print a statement to indicate this passenger is boarding the ferry
    puts "#{rider_name} is boarding the ferry!"

  end

  def find_seat(introvert_level)
    # this method will inspect the introvert level of this passenger (10 is very introverted, 1 is very extroverted), and it will 
    # choose the seat that this passenger should look for
    # the seat recommendation will be printed out
    case introvert_level
      when 1..4
        puts "Seat recommendation for this passenger: sit in galley with talkers"
      when 5..8
       puts "Seat recommendation for this passenger: sit in back of boat"
      else
        puts "Seat recommendation for this passenger: go upstairs to quiet room"
    end
  end

  def jump_overboard(rider_name)
    # this method will have the specified rider jump overboard, with gusto
    puts "#{rider_name} is OUT! See ya!"
  end

end

mitch = Ferry_rider.new('Mitch Middle of Road Meckle')
mitch.find_seat(5) 
mary = Ferry_rider.new('Mary Ready for Fun Smith')
mary.find_seat(1)
tom = Ferry_rider.new('Tom Meek as Mouse Jones')
tom.find_seat(9)

mitch.jump_overboard('Mitch')

# create 50 instances of Ferry_rider class
# and store in an array of Ferry_rider instances
# the rider names start at position 1, the array indexes start at position 0
people_on_board = []
for counter in 1..50
  rider_name = 'Ferry Rider #' + counter.to_s
  people_on_board.push(Ferry_rider.new(rider_name))
end
# for each Ferry_rider instance stored in the array, call pick_seat and jump_overboard methods
# assign random introvert levels for now - choose an integer between 1 and 10 
rider_number=1
people_on_board.each do |rider|
  introvert_level_for_this_rider = rand(1..10)
  rider.find_seat(introvert_level_for_this_rider)
  rider.jump_overboard('Ferry Rider #' + rider_number.to_s)
  rider_number += 1
end
