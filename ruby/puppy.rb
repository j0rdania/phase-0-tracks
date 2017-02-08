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

end

trix = Puppy.new
trix.fetch('biscuit')
