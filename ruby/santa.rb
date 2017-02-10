# Santacon project 6.3

# define Santa class
class Santa
  # use shortcut to declare age and ethnicity variables readable from outside of class
  attr_reader :age,:ethnicity
  # use shortcut to declare gender variable as writable and readable from outside class
  attr_accessor :gender

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

  # method to print reindeer ranking
  def print_reindeer_ranking
    puts @reindeer_ranking
  end

  # three attribute changing methods:
  # method to add one year to age
  def celebrate_birthday
    @age += 1
  end

  # method to move given reindeer to end of ranking
  def get_mad_at(reindeer_name)
    # find index where this reindeer is located and remove it
    @reindeer_ranking.delete(reindeer_name)
    # add it to the end of the array
    @reindeer_ranking.push(reindeer_name)
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

# driver code to test
puts "1st Santa's age before birthday: " + santas[0].age.to_s
santas[0].celebrate_birthday
puts "1st Santa's age after birthday: " + santas[0].age.to_s
puts "Reindeer ranking before Donner got caught: "
santas[0].print_reindeer_ranking 
santas[0].get_mad_at('Donner')
puts "Reindeer ranking after Donner got caught: "
santas[0].print_reindeer_ranking 
puts "1st Santa's gender before change: #{santas[0].gender}"
santas[0].gender = 'female'
puts "1st Santa's gender after change: #{santas[0].gender}"
puts "1st Santa's ethnicity: #{santas[0].ethnicity}"
puts

# create lots of santas with randomly generated attributes
example_genders = ["agender", "female", "bigender", "male", "female", "gender fluid", "N/A"]
example_ethnicities = ["black", "Latino", "white", "Japanese-African", "prefer not to say", "Mystical Creature (unicorn)", "N/A"]
for santa_limit in 0..250
  # pick random # to get array index - use that to define ethnicity
  target_ethnicity = example_ethnicities[rand(0..(example_ethnicities.length - 1))]
  target_gender = example_genders[rand(0..(example_genders.length - 1))]
  santas.push(Santa.new(target_gender,target_ethnicity))
  # set this santa's age to a randomly generated number between 0 and 140
  # normally, I would either add an age parameter to the initialize method
  # or give write access to the age attribute with attr_accessor; however,
  # as an exercise, I will use the celebrate_birthday method to advance the age
  target_age=rand(0..140)
  # puts "target age for santa #{santa_limit} is: #{target_age}"
  until santas[santa_limit].age == target_age
    santas[santa_limit].celebrate_birthday
  end
  puts "This Santa's age after lots of birthdays: #{santas[santa_limit].age}"
  puts "This Santa's gender: #{santas[santa_limit].gender}"
  puts "This Santa's ethnicity: #{santas[santa_limit].ethnicity}"
  puts
end

