##############    RELEASE 0    #####################
puts "RELEASE 0"
#define method that will take block code as argument
def display_favorite_things
puts "This method is gearing up to start!"
# yield to block code in method call, passing three colors
yield("blue","purple","pink")
# yield to block code in method call, passing three sports
yield("soccer","football","jazzercise")
puts "This method is all done with work and is winding down."
end
#call method
display_favorite_things{|thing1,thing2, thing3| puts "My favorite things are: #{thing1}, #{thing2}, and #{thing3}!"}
#print blank line
puts

###################     RELEASE 1   ##################
puts "RELEASE 1"
# declare junk food Array
junk_food = [
"pizza",
"candy",
"taffy",
"potato chips",
"licorice"
]
#declare fruits Array
fruits = [
"banana",
"apple",
"pear",
"strawberry"
]
#declare favorite foods hash
favorite_foods = {
jordan: "green beans",
ben: "kale",
simon: "lettuce",
trixie: "kibble"
}
#iterate through fruits array and print each value
puts "Fruits (by way of .each call on array):"
fruits.each do |fruit|
puts "#{fruit}"
end
#print hash before .each method call
puts "Favorite Foods hash:"
puts favorite_foods
#iterate through favorite foods hash and print each key/value pair
puts "Favorite foods (by way of .each call on hash):"
favorite_foods.each do |person,fave_food|
puts "#{person} likes #{fave_food}"
end
# print array to show fruits current contents
puts "fruits before .map method call:"
puts fruits
#iterate through fruits array and change values in place to junk food
puts "Now, get ready, folks. We are going to use the .map! method on the fruits to magically change them from healthy to unhealthy foods!"
junk_food_index = -1
fruits.map! do |fruit|
#increment junk food array index
junk_food_index += 1
puts "changing fruit #{fruit} to junk food #{junk_food[junk_food_index]}"
# set last value to junk food so that fruits are replaced with junk foods
junk_food[junk_food_index]
end
# print array to show it has been modified (fruits to junk foods) by .map! method call
puts "fruits after .map method call:"
puts fruits
#add blank line
puts

##################   RELEASE 2    ##################################
puts "RELEASE 2"

###### ARRAYS  #######
puts "methods on ARRAYS:"
# create array to hold modified arrays
mod_numbers= []
# create array with integers
numbers = [5,1,3,7,9,2,3,4,5,6,3,7,9,1,0,6,22]
#display starting array
puts "starting array is "
puts numbers
# add calls to arrays for four conditions
# delete items that meet a certain criteria
puts "delete all items that are 8 or above - delete_if method"
mod_numbers = numbers.delete_if { |x| x >=8 }
#display ending array
puts "array after delete_if method:"
puts mod_numbers
#filter for only items that satisfy criteria
puts "filter for only items that are 3 or above - first method - select"
mod_numbers = numbers.select {|y| y >= 3 }
puts "array after select! method:"
puts mod_numbers
#filter for only items that satisfy criteria - second method
puts "filter for only items that are 5 or less - second method - keep_if"
mod_numbers = numbers.keep_if {|z| z <= 5 }
puts "array after keep_if! method:"
puts mod_numbers
#remove items until condition in block evaluates to false
puts "remove items until (value <> 4) is false  - drop_while method"
mod_numbers = numbers.drop_while {|w| w != 4 }
puts "array after drop_while! method:"
puts mod_numbers

########  HASHES  ########
puts "methods on HASHES:"
# create hash to hold modified hashes
mod_fav_letters= {}
# create hash with people and their favorite letters
letters = {
  jordan: "a'",
  betty: "d",
  frank: "b",
  william: "x",
  simon: "r",
  ben: "w",
  arthur: "u",
  shirley: "q"
}
