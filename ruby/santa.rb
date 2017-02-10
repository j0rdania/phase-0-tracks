# Santacon project 6.3

# define Santa class
class Santa

  # define initialize method
  def initialize
    puts "Initializing Santa instance"
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

bob_santa = Santa.new()
bob_santa.speak
bob_santa.eat_milk_and_cookies('lemon jumble')


