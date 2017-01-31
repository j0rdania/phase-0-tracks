
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
  num_houses = num_houses.to_i
end
# fill array with house styles for each house owned by client
# declare empty array of house styles
house_type_list=[]
if !(num_houses.nil?) && (num_houses >= 1)
  # get style of each house
  for i in 1..num_houses
    # get style of house i
    puts "Please enter style of house " + i.to_s
    this_style=gets.chomp
    # populate array with the style of house i
    house_type_list.push(this_style)
  end
else
  house_type_list=nil
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
  house_styles: house_type_list,
  minimalist: minimalist_pref,
  number_children: num_kids,
  credit_rating: cr_rating
}
# display message for user to view his or her entries
puts "Please confirm your entries:"
puts client
# ask user if he or she would like to update a field value
puts "If you would like to update a field, please enter the field name (enter 'none' if everything looks right)"
field_to_update=gets.chomp
if field_to_update == 'none'
  # no need to update field
else
  # ask user for new value for specified field
  puts "Please enter new value for the " + field_to_update + ' field:'
  new_value=gets.chomp
  # convert new_value to proper type, if necessary
  # note: we assume that user entered a value of the correct type. 
  case field_to_update
    when "number_of_houses","number_children","credit_rating"
      new_value = new_value.to_i
    when "minimalist"
      if new_value.nil? || new_value == ''
        new_value=nil
      elsif new_value.upcase == 'Y' 
        new_value=true
        elseif new_value.upcase == 'N'
        new_falue=false
        elseif new_value == 'U'
        new_value=nil
      else
        new_value=nil
      end
    when "house_styles"
      # ask which house entry needs to be changed
      puts "Please enter the house number that correspons to the new style entered (1 for first house listed, 2 for second house listed, etc.)"
      house_num=gets.chomp.to_i
  end
end
# set value in hash for specified key
if field_to_update == 'house_styles'
  # set appropriate house_styles array entry to new house style
  house_type_list[house_num]=new_value
  # load array into new value in preparation for placing in hash
  new_value=house_type_list
end
# set client hash key to new value 
client[field_to_update.to_sym]=new_value

# thank user and display entered information (with updated field, if applicable)
puts "Thank you. The following information has been entered:"
puts client
