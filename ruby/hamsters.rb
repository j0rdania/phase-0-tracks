 puts "Please enter the hamster's name "
 ham_name = gets.chomp
 
 puts "On a scale of 1 to 10, how light of a sleeper are you? 1 is very light, 10 is like a rock. "
 sleeper = gets.chomp.to_f
 sleeper = sleeper.round
 
 puts "Please enter the fur color "
 fur_color = gets.chomp
 
 puts "Is the hamster a good candidate for adoption? Please enter Y or N"
 
 valid_data = FALSE
 
 while valid_data == FALSE
  adoption_candidate = gets.chomp.upcase
  if adoption_candidate.start_with? 'Y'
    adoption_candidate = TRUE
    valid_data = TRUE
  elsif adoption_candidate.start_with? 'N'
    adoption_candidate = FALSE
    valid_data = TRUE
  else 
    puts "Please enter Yes or No"
    valid_data = FALSE
  end
end

 puts "Please enter estimated age of hamster "
 age = gets.chomp.to_i
 if age == ''
   age = nil
 end
 
 puts "\n" + "Data Entry:"
 puts "Hamster's Name: #{ham_name}"
 puts "Sleeper Level: #{sleeper}"
 puts "Fur Color: #{fur_color}"
 puts "Candidate for adoption? #{adoption_candidate}"
 puts "Hamster's Age: #{age}"