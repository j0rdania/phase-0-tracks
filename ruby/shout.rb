# module Shout
  
#   # yell angrily method
#   def self.yell_angrily(words)
#     words + "!!!" + " :("
#   end

#    # yell happily method
#   def self.yell_happily(words)
#     words + "!!!" + " :)"
#   end

# end
  
# puts Shout.yell_angrily('Darn it')
# puts Shout.yell_happily('Goodie')

# mixin version of Shout module

module Shout

    # yell angrily method
  def yell_angrily(words)
    words + "!!!" + " :("
  end

   # yell happily method
  def yell_happily(words)
    words + "!!!" + " :)"
  end

end

class Toddler
  include Shout
end
  
class Teacher
  include Shout
end 

billy = Toddler.new
puts billy.yell_happily('I like mud')
ms_smith = Teacher. new
puts ms_smith.yell_angrily('Sit down, Billy')
puts billy.yell_angrily("I don't want to sit down")
puts ms_smith.yell_happily("Ha ha. I'm in charge")
