
# Designs R Us Client Information Gathering System

# collect each field from screen

puts "This utility will collect data for a new client."
puts "Please enter client's first name: "
fname=gets.chomp
puts "Please enter client's last name: "
lname=gets.chomp
puts "Please enter client's email address: "
email=gets.chomp
puts "Please enter client's phone number: "
phone=gets.chomp
puts "Please enter number of houses client owns: (if unknown, press enter)"
num_houses=gets.chomp.to_i

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

puts "How many children does this client have? (if unknown, press enter)"
num_kids=gets.chomp
if num_kids.nil? || num_kids==''
  num_kids=nil
else
  num_kids=num_kids.to_i
end

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
