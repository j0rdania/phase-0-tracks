#Welcome the user
puts "Welcome to the werewolf detection utility."

#Ask how many employees the user wants to process
puts "How many employees would you like to process? "
num_emp = gets.chomp.to_i
until num_emp != 0     # entered value must be integer
  puts "Please enter integer"
  num_emp = gets.chomp.to_i
end

# Detect werewolf status for each employee
i=1
while i <= num_emp
  #############    interview employee  ##############################
  puts "What is your name?"
  emp_name = gets.chomp
  puts "How old are you?"
  emp_age = gets.chomp.to_i
  puts "What year were you born?"
  emp_year_born = gets.chomp.to_i
  puts "Our company cafeteria serves garlic bread. Should we order some for you?"
  valid_answer = false
  while valid_answer == false
    garlic_answer = gets.chomp.upcase
    if garlic_answer.start_with? 'Y'
      will_eat_garlic_bread = true
      valid_answer = true
    elsif garlic_answer.start_with? 'N'
      will_eat_garlic_bread = false
      valid_answer = true
    else
      puts "Please enter Y or N"
    end
  end
  puts "Would you like to enroll in the company's health insurance?"
  valid_answer = false
  while valid_answer == false
    insurance_answer = gets.chomp.upcase
    if insurance_answer.start_with? 'Y'
      wants_insurance = true
      valid_answer = true
    elsif insurance_answer.start_with? 'N'
      wants_insurance = false
      valid_answer = true
    else
      puts "Please enter Y or N"
    end
  end
  # check for allergies. continue until user types "done" or "sunshine" 
  puts "Please enter allergies, one at a time. When you are finished, enter 'done'"
  allergy = gets.chomp.downcase
  while (allergy != "done") && (allergy != "sunshine")
    puts "Please enter allergies, one at a time. When you are finished, enter 'done'"
    allergy = gets.chomp.downcase
  end
  

  ##############  determine if new employee is a vampire  ############
  status=nil

  #determine if user entered a valid age
  today_date = Time.now
  #determine correct age for year of birth
  year_span_bt_dob_and_today = (today_date.year - emp_year_born)
  # depending on the month and day of the employee's birth date, there would be two valid ages. for example,
  # my birthday is June 8, 1967. Between Jan. 1, 2017
  # and June 7, 2017, I am 49. but between June 8, 2017 and Dec. 31, 2017, I am 50. (2017-1967=50)
  if (year_span_bt_dob_and_today == emp_age) | ((year_span_bt_dob_and_today - 1) == emp_age)
    valid_age_entered=true
  else
    valid_age_entered = false
  end

  #if employee got age right and is willing to eat garlic bread or sign up for insurance -> probably not a vampire
  if valid_age_entered && will_eat_garlic_bread
    status = 'Probably not a vampire'
  end

  # if the employee got their age wrong and (hates garlic or does not want insurance) -> probably a vampire
  if !valid_age_entered && (!will_eat_garlic_bread | !wants_insurance)
    status = 'Probably a vampire'
  end

  # if the employee got their age wrong and hates garlic and does not want insurance) -> almost certainly a vampire
  if !valid_age_entered && !will_eat_garlic_bread && !wants_insurance
    status='Almost certainly a vampire'
  end

  # if name is Drake Cula or Tu Fang -> definitely a vampire
  if (emp_name == 'Drake Cula') | (emp_name == 'Tu Fang')
    status='Definitely a vampire'
  end

  # if user has an allergy to sunshine -> probably a vampire)
  if allergy == "sunshine"
    status='Probably a vampire'
  end

  # if none of the above conditions met -> results inconclusive
  # if status is nil, it was never set
  if !status
    status='Results inconclusive'
  end
  puts "Vampire Status: #{status}"
  i += 1
end
puts "Actually, never mind! What do these qustions have to do with anything? Let's all be friends."