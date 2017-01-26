puts "What is your name?"
emp_name=gets.chomp

puts "How old are you?"
emp_age=gets.chomp.to_i

puts "What year were you born?"
emp_year_born=gets.chomp.to_i

puts "Our company cafeteria serves garlic bread. Should we order some for you?"

valid_answer=false
while valid_answer==false
  garlic_answer=gets.chomp.upcase
  if garlic_answer.start_with? 'Y'
    order_garlic_bread=true
    valid_answer=true
  elsif garlic_answer.start_with? 'N'
    order_garlic_bread=false
    valid_answer=true
  else
    puts "Please enter Y or N"
  end
end

puts "Would you like to enroll in the company's health insurance?"
valid_answer=false
while valid_answer==false
  insurance_answer=gets.chomp.upcase
  if insurance_answer.start_with? 'Y'
    wants_insurance=true
    valid_answer=true
  elsif insurance_answer.start_with? 'N'
    wants_insurance=false
    valid_answer=true
  else
    puts "Please enter Y or N"
  end
end