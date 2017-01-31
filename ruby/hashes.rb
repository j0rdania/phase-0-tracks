
# Designs R Us Client Information Gathering System

############   collect each field from screen   #####################

# display welcome message
puts "This utility will collect data for a new client."
# get first name
puts "Please enter client's first name: "
fname=gets.chomp
# get last name
puts "Please enter client's last name: "
lname=gets.chomp
# get email address
puts "Please enter client's email address: "
email=gets.chomp
# get phone number
puts "Please enter client's phone number: "
phone=gets.chomp
# get number of houses owned; if user hits enter key, set number of houses to nil; otherwise, convert it to integer
puts "Please enter number of houses client owns: (if unknown, press enter)"
num_houses=gets.chomp
if num_houses.nil? || num_houses == ''
  num_houses=nil
else
  num_houses.to_i
end
# find out if client is a minimalist; make sure user enters one of the following acceptable values and set minimalist_pref field accordingly:
# y or Y: true
# n or N: true
# u or U: nil
# user presses enter key: nil
puts "Is client a minimalist? (answer Y, N, or U for unknown)"
answer=gets.chomp.upcase
valid_answer=false
until valid_answer 
  if answer.nil? || answer==''
    minimalist_pref=nil
    valid_answer=true
  elsif  answer[0] == 'Y' 
    minimalist_pref=true
    valid_answer=true
  elsif answer[0] == 'N' 
    minimalist_pref=false
    valid_answer=true
  elsif answer[0] == 'U' 
    minimalist_pref=nil
    valid_answer=true
  else
    puts "Please enter 'Y', 'N', or 'U'"
    answer=gets.chomp.upcase
  end
end
# get number of children; if user hits enter key, set number of children to nil; otherwise, convert it to integer
puts "How many children does this client have? (if unknown, press enter)"
num_kids=gets.chomp
if num_kids.nil? || num_kids==''
  num_kids=nil
else
  num_kids=num_kids.to_i
end
# get credit rating; if user hits enter key, set credit rating to nil; otherwise, convert it to integer
puts "Please enter client's credit rating (if unknown, press enter):"
cr_rating=gets.chomp
if cr_rating.nil? || cr_rating==''
  cr_rating=nil
else
  cr_rating=cr_rating.to_i
end 

#place collected data in a hash object
client = {
  first_name: fname,
  last_name: lname,
  email_address: email,
  phone_number: phone,
  number_of_houses: num_houses,
  minimalist: minimalist_pref,
  number_children: num_kids,
  credit_rating: cr_rating
}
puts "Please confirm your entries:"
puts client
puts "If you would like to update a field, please enter the field name (enter 'none' if everything looks right)"
field_to_update=gets.chomp
if filed_to_update == 'none'
  # no need to update field
else
puts 'add update field code here'

end

puts "Thank you. The following information has been entered:"
puts client
