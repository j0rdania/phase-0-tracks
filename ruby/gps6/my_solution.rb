# Virus Predictor

# I worked on this challenge with Ransom Byers (John Gill guide).
# We spent 2.5 hours on this challenge.

# EXPLANATION OF require_relative
# require_relative allows the code in this file to see the data/code that is in the referenced file.
# the "relative" part makes it so this code starts looking for the referenced file in the directory where this file is located.
#
require_relative 'state_data'

class VirusPredictor

  # accept state, population density, and population values
  # and set instance variables - this method called upon .new
  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  # call predicted_deaths and speed_of_spread methods
  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private

  # calculate predicted deaths based on pop. density and print out results for this state
  def predicted_deaths
    # predicted deaths is solely based on population density
    case @population_density
      when 0..49
        multiplier_factor = 0.05
      when 50..99
        multiplier_factor = 0.1
      when 100..149
        multiplier_factor = 0.2
      when 150..199
        multiplier_factor = 0.3
      else
        multiplier_factor = 0.4
    end
    
    number_of_deaths = (@population * multiplier_factor).floor

    print "#{@state} will lose #{number_of_deaths} people in this outbreak"

  end

 # calculate speed of spread for this state based on pop. density
  def speed_of_spread    #in months
    # We are still perfecting our formula here. The speed is also affected
    # by additional factors we haven't added into this functionality.
    case @population_density
      when 0..49
        speed = 2.5
      when 50..99
        speed = 2
      when 100..149
        speed = 1.5
      when 150..199
        speed = 1
      else
        speed = 0.5
    end

    puts " and will spread across the state in #{speed} months.\n\n"

  end

end

#=======================================================================

# DRIVER CODE
 # initialize VirusPredictor for each state
STATE_DATA.each do |state_name,pop_data|
  VirusPredictor.new(state_name, pop_data[:population_density], pop_data[:population]).virus_effects
end

# alabama = VirusPredictor.new("Alabama", STATE_DATA["Alabama"][:population_density], STATE_DATA["Alabama"][:population])
# alabama.virus_effects

# jersey = VirusPredictor.new("New Jersey", STATE_DATA["New Jersey"][:population_density], STATE_DATA["New Jersey"][:population])
# jersey.virus_effects

# california = VirusPredictor.new("California", STATE_DATA["California"][:population_density], STATE_DATA["California"][:population])
# california.virus_effects

# alaska = VirusPredictor.new("Alaska", STATE_DATA["Alaska"][:population_density], STATE_DATA["Alaska"][:population])
# alaska.virus_effects


# REVIEW AND REFLECT
# What are the differences between the two different hash syntaxes shown in the state_data file?
#   a. the one with the => (the outside hash) uses a string as the key; 
#   the one with the : (the inside hash) uses a symbol as a key.
#   b. therefore, the access the outside hash, we use a string (i.e. STATE_DATA['Alabama']); to access the 
#   inside hash, we use a symbol (i.e. STATE_DATA['Alabama'][:population_density])
# What does require_relative do? How is it different from require? 
#   require_relative allows the code in the given section to reference code that is located in another file; 
#   the "relative" part tells the code to start looking for the other code in the current directory,
#   the directory that contains this code
# What are some ways to iterate through a hash?
#   a. you can use .each do |key, value|
#   end, where the code to execute for each hash entry is between do and end
#   b. you can use .each {|key,value| <code to execute here>} for shorter segments of code
#   c. if you only need the keys, you can use .each_key instead of .each
#   d. if you only need the values, you can use .each_value instead of .each
# When refactoring virus_effects, what stood out to you about the variables, if anything?
# The variables were instance variables, so there was no need to pass them into the method.
# What concept did you most solidify in this challenge?
# Having a hash within a hash was a bit tricky for me to wrap my brain around. My guide and my pair were both very helpful 
# explaining the structure and various ways to access the hash elements.



