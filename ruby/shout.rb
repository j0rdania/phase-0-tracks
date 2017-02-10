module Shout
  
  # yell angrily method
  def self.yell_angrily(words)
    words + "!!!" + " :("
  end

   # yell happily method
  def self.yell_happily(words)
    words + "!!!" + " :)"
  end

end
  
puts Shout.yell_angrily('Darn it')
puts Shout.yell_happily('Goodie')