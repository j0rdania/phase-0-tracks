# Replace in the "<???>" with the appropriate method (and arguments, if any).
# Uncomment the calls to catch these methods red-handed.

# When there's more than one suspect who could have
# committed the crime, add additional calls to prove it.


# DETECTIVE NOTE: you could use lots of argument combinations to make the sub, sub!, gsub and gsub! methods work. for example,
# in the usual suspects case, change "ual" to "ual suspects", change "al" to "al suspects", etc.


# "iNvEsTiGaTiOn".<???>
# => "InVeStIgAtIoN"
puts "swapcase: " + "iNvEsTiGaTiOn".swapcase
puts "swapcase!: " + "iNvEsTiGaTiOn".swapcase!

# "zom".<???>
# => "zoom"
puts "gsub o with oo: " + "zom".gsub("o","oo")
puts "gsub! o with oo: " + "zom".gsub!("o","oo")
puts "gsub zom with zoom: " + "zom".gsub("zom","zoom")
puts "gsub! zom with zoom: " + "zom".gsub!("zom","zoom")
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
puts "sub: " +  "enhance".sub('enhance','    enhance    ')
puts "double check sub with begin and end chars: " + "1" + "enhance".sub('enhance','    enhance    ') + "1"
puts "sub!: " +  "enhance".sub!('enhance','    enhance    ')
puts "double check sub! with begin and end chars: " + "1" + "enhance".sub!('enhance','    enhance    ') + "1"
puts "replace: " +  "enhance".replace('    enhance    ')
puts "double check replace with begin and end chars: " + "1" + "enhance".replace('    enhance    ') + "1"

# "Stop! You’re under arrest!".<???>
# => "STOP! YOU’RE UNDER ARREST!"
puts "upcase: " + "Stop! You’re under arrest!".upcase
puts "upcase!: " + "Stop! You’re under arrest!".upcase!
puts "gsub: " + "Stop! You’re under arrest!".gsub("Stop! You’re under arrest!","STOP! YOU’RE UNDER ARREST!")
puts "gsub!: " + "Stop! You’re under arrest!".gsub!("Stop! You’re under arrest!","STOP! YOU’RE UNDER ARREST!")
puts "replace: " + "Stop! You’re under arrest!".replace("STOP! YOU’RE UNDER ARREST!")
puts "sub: " + "Stop! You’re under arrest!".sub("Stop! You’re under arrest!","STOP! YOU’RE UNDER ARREST!")
puts "sub!: " + "Stop! You’re under arrest!".sub!("Stop! You’re under arrest!","STOP! YOU’RE UNDER ARREST!")

# "the usual".<???>
#=> "the usual suspects"
puts "gsub: " + "the usual".gsub("the usual","the usual suspects")
puts "gsub test of shorter first argument: " + "the usual".gsub("al","al suspects")
puts "gsub!: " + "the usual".gsub!("the usual","the usual suspects")
puts "replace: " + "the usual".replace("the usual suspects")
puts "concat: " + "the usual".concat(' suspects')
puts "insert: " + "the ususal".insert(-1,' suspects')
puts "ljust: " + "the usual".ljust(18,' suspects')
puts "sub: " + "the usual".sub("the usual","the usual suspects")
puts "sub!: " + "the usual".sub!("the usual","the usual suspects")

# "The case of the disappearing last letter".<???>
# => "The case of the disappearing last lette"
puts "gsub: " + "The case of the disappearing last letter".gsub("The case of the disappearing last letter","The case of the disappearing last lette")
puts "gsub!: " + "The case of the disappearing last letter".gsub!("The case of the disappearing last letter","The case of the disappearing last lette")
puts "replace: " + "The case of the disappearing last letter".replace("The case of the disappearing last lette")
puts "gsub test for shorter string: " + "The case of the disappearing last letter".gsub("letter","lette")
puts "gsub! test for shorter string: " + "The case of the disappearing last letter".gsub!("letter","lette")
puts "slice!: " + "The case of the disappearing last letter".slice!("The case of the disappearing last lette")
puts "sub: " + "The case of the disappearing last letter".sub("The case of the disappearing last letter","The case of the disappearing last lette")
puts "sub!: " + "The case of the disappearing last letter".sub!("The case of the disappearing last letter","The case of the disappearing last lette")


# "The mystery of the missing first letter".<???>
# => "he mystery of the missing first letter"

# "Elementary,    my   dear        Watson!".<???>
# => "Elementary, my dear Watson!"

# "z".<???>
# => 122 
# (What is the significance of the number 122 in relation to the character z?)

# "How many times does the letter 'a' appear in this string?".<???>
# => 4