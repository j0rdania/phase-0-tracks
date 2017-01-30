# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.

# "iNvEsTiGaTiOn".<???>
# => "InVeStIgAtIoN"
puts "swapcase: " + "iNvEsTiGaTiOn".swapcase
puts "swapcase!: " + "iNvEsTiGaTiOn".swapcase!

# "zom".<???>
# => "zoom"
puts "gsub: " + "zom".gsub("o","oo")
puts "gsub!: " + "zom".gsub!("o","oo")
puts "replace: " + "zom".replace("zoom")
puts "insert index pos 1: " + "zom".insert(1,"o")
puts "insert index pos 2: " + "zom".insert(2,"o")
puts "sub: " + "zom".sub("o","oo")
puts "sub!: " + "zom".sub!("o","oo")

# "enhance".<???>
# => "    enhance    "
puts "center: " +  "enhance".center(15,padstr=' ')
puts "double check center with begin and end chars: " + "1" +"enhance".center(15,padstr=' ') + "1"
puts "gsub: " +  "enhance".gsub('enhance','    enhance    ')
puts "double check gsub with begin and end chars: " + "1" + "enhance".gsub('enhance','    enhance    ') + "1"
puts "gsub!: " +  "enhance".gsub!('enhance','    enhance    ')
puts "double check gsub! with begin and end chars: " + "1" + "enhance".gsub!('enhance','    enhance    ') + "1"
puts "replace: " +  "enhance".replace('    enhance    ')
puts "double check replace with begin and end chars: " + "1" + "enhance".replace('    enhance    ') + "1"

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