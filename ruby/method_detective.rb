# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

puts "swapcase: " + "iNvEsTiGaTiOn".swapcase
# => “InVeStIgAtIoN”

puts "swapcase!: " + "iNvEsTiGaTiOn".swapcase!
# => “InVeStIgAtIoN”

puts "gsub: " + "zom".gsub("o","oo")
# => “zoom”
puts "gsub!: " + "zom".gsub!("o","oo")
# => “zoom”
puts "replace with zoom: " + "zom".replace("zoom")
# => “zoom”
puts "insert index pos 1: " + "zom".insert(1,"o")
# => “zoom”
puts "insert index pos 2: " + "zom".insert(2,"o")
# => “zoom”
puts "sub: " + "zom".sub("o","oo")
# => “zoom”
puts "sub!: " + "zom".sub!("o","oo")
# => “zoom”
 


# "enhance".<???>
# => "    enhance    "

# "Stop! You’re under arrest!".<???>
# => "STOP! YOU’RE UNDER ARREST!"

# "the usual".<???>
#=> "the usual suspects"

# " suspects".<???>
# => "the usual suspects"

# "The case of the disappearing last letter".<???>
# => "The case of the disappearing last lette"

# "The mystery of the missing first letter".<???>
# => "he mystery of the missing first letter"

# "Elementary,    my   dear        Watson!".<???>
# => "Elementary, my dear Watson!"

# "z".<???>
# => 122 
# (What is the significance of the number 122 in relation to the character z?)

# "How many times does the letter 'a' appear in this string?".<???>
# => 4