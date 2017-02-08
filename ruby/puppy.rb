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
  def initialize
    # this initialize method will print a statement to indicate this passenger is boarding the ferry
    puts "I am boarding the ferry!"
  end

  def find_seat(introvert_level,commuter_boat_flag)
    # this method will inspect the introvert level of this passenger (10 is very introverted, 1 is very extroverted)
    # and the commuter boat flag (set to true if this is a commuter boat which is normally crowded), and it will 
    # choose the seat that this passenger should look for
    if commuter_boat_flag
      return 'take first available seat'
    else
      case introvert_level
        when 1..4
          return 'sit in galley with talkers'
        when 5..8
          return 'sit in back of boat'
        else
          return 'go upstairs to quiet room'
      end
    end
  end

end

jordan = Ferry_rider.new
puts jordan.find_seat(5,false)
mary = Ferry_rider.new
puts mary.find_seat(8,true)
tom = Ferry_rider.new
puts tom.find_seat(9,false)
simon = Ferry_rider.new
puts simon.find_seat(1,false)