# Virus Predictor

# I worked on this challenge [by myself, with: ].
# We spent [#] hours on this challenge.

# EXPLANATION OF require_relative
# require_relative allows the code in this file to see the data/code that is in the referenced file.
# the "relative" part makes it so this code starts looking for the referenced file in the directory where this file is located.
#
require_relative 'state_data'

class VirusPredictor

  def initialize(state_of_origin, population_density, population)
    @state = state_of_origin
    @population = population
    @population_density = population_density
  end

  def virus_effects
    predicted_deaths
    speed_of_spread
  end

  private

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