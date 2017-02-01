
def display_favorite_things
  puts "This method is gearing up to start!"
  yield("blue","purple","pink")
  yield("1","2","3")
  puts "This method is all done with work and is winding down."
end

display_favorite_things{|thing1,thing2, thing3| puts "My favorite things are: #{thing1}, #{thing2}, and #{thing3}!"}