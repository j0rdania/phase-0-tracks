# Santacon project 6.3

# define Santa class
class Santa

  # define initialize method
  def initialize(gender,ethnicity)
    puts "Initializing Santa instance"
    @gender = gender
    @ethnicity = ethnicity
    @reindeer_ranking = ["Rudolph", "Dasher", "Dancer", "Prancer", "Vixen", "Comet", "Cupid", "Donner", "Blitzen"]
    @age = 0
  end
  # define speak method
  def speak
    puts "Ho, ho, ho! Haaaappy holidays!"
  end

  # define eat_milk_and_cookies method
  def eat_milk_and_cookies(cookie_type)
    puts "That was a good #{cookie_type}!"
  end
end

# comment out this driver code because arguments have been added to initialize method
# bob_santa = Santa.new
# bob_santa.speak
# bob_santa.eat_milk_and_cookies('lemon jumble')


# some diverse initializations of Santa instances
# declare empty array of santas
santas = []
# add first Santa
santas.push(Santa.new('male','white'))
# add 10 more Santas
sample_ethnicities = ['Korean','Japanese','Indian','Unicorn']
for santa_limit in 1..10
  # pick random # between 0 and 3 - use that to define ethnicity
  # use all male Santas - some things never change
  santas.push(Santa.new('male',sample_ethnicities[rand(0..3)]))
end
