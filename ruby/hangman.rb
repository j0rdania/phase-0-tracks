# 6.5
# Jordan Levine
# Hangman Game Class

# rules of this game:
#   a. player 1 enters a word for player 2 to guess
#   b. player 2 can keep guessing letters, one at a time, until he is out of guesses or he guesses all of the letters.
#   c. after each guess, the current progress of player 2 is displayed (blanks for unguessed letters, actual letter for guessed letters)
#   d. the number of wrong guesses allowed is equal to the length of the word to guess
#   e. if the player accidentally repeats a letter already guessed, it is not counted
#   f. if a player guesses a correct letter, it is not counted

# define Hangman class
class Hangman
  # declare word_to_guess array as readable from outside of class
  attr_reader :word_to_guess
  # declare number_guesses_left attribute as readable from outside of class
  attr_reader :number_guesses_left
  # declare letters_tried attribute as readable from outside of class
  # note: i did this to make the rspec file work, but I really don't want
  # this attribute readable from outside of this class - need to ask about this
  attr_reader :letters_tried

# 1. we need an initialize method to:
#  a.  accept a word that is going to be guessed; this word can be placed in an array of characters (word_to_guess), an instance variable

#  b. set the number_guesses_left attribute to the length of the word to be guessed - also an instance variable (and readable from outside class)

#  c. create an empty array (letters_tried) that will hold letters that have been tried; it will be an array of hashes, each having the letter guessed and the found status (boolean)

  def initialize(player_1_word)
      @word_to_guess = player_1_word.split('')
      @number_guesses_left = @word_to_guess.length
      @letters_tried=[]
  end

# 2. we need a method (get_word) to get the word to guess - it will join the letters from the array back together and return a string with the word to guess
  def get_word
    @word_to_guess.join
  end

# 2.5  we need a method (has_been_guessed_correctly?) to determine if a particular letter has already been guessed correctly; this method will look in the letters_tried array to see if that letter is present and if its correct status is true. return true if yes and false if no. 
  def has_been_guessed_correctly?(in_letter)
    @letters_tried.any? {|letter_combo|letter_combo[:letter] == in_letter && letter_combo[:correct] == true}
  end

# 3. we need a method (show_progress) to create a string showing the player's progress; compare each letter in the word_to_guess array to the letters_tried array; include blanks for unguessed characters and the correct letter for each guessed character; if there are multiple occurrences of a letter, that letter will appear multiple times in the progress string
  def show_progress
    progress_string=''
    @word_to_guess.each do |letter_in_word_to_guess|
      if has_been_guessed_correctly?(letter_in_word_to_guess)
        progress_string += letter_in_word_to_guess
      else
        progress_string += '_'
      end
    end
    return progress_string
  end

# 4. we need a method (has_been_guessed?) to determine if a particular letter has already been guessed; this method will look in the letters_tried array to see if that letter is present. return true if yes and false if no. (it does not matter if the letter was correct or not; we just want to know if the letter has been guessed)
  def has_been_guessed?(in_letter)
    @letters_tried.any? {|letter_combo|letter_combo[:letter] == in_letter}
  end

# 5. we need a method (check_letter) to make sure the letter has not already been guessed, look for a particular letter in the word_to_guess array, populate the letters_tried array with the letter and correct status, and decrement the number_guesses_left variable if not found. this method should return true if the letter was found at least once, and return false if the letter was not found. (note: this method does not check already guessed status)

  def check_letter(in_letter)
    # find out if this is a correct guess
    correct_status = false
    if word_to_guess.include? in_letter
      correct_status=true
    else
      # bad guess; decrement number_guesses_left
      @number_guesses_left -= 1
    end
    # put letter in letters_tried with correct/wrong status
    new_letter_combo = {
      letter: in_letter,
      correct: correct_status
    }
    letters_tried.push(new_letter_combo)
    return correct_status
  end

# 6. we need a method (all_letters_guessed?) to determine if all letters have been correctly guessed. it should return true if so, false if there are still mystery letters that need to be guessed
  def all_letters_guessed?
    @word_to_guess.each do |letter_in_word_to_guess|
        if !has_been_guessed_correctly?(letter_in_word_to_guess)
          return false
        end
    end
    return true
  end
end

######################### DRIVER CODE  ###################
# ask player #1 to enter a word
puts "Player 1: Please enter a word for your opponent to guess: "
entered_value = gets.chomp
while (entered_value == nil) || (entered_value == '')
  puts "Player 1: Please enter a word for your opponent to guess: "
  entered_value = gets.chomp
end
# initialize new game
this_game = Hangman.new(entered_value)
# enter several line feeds so player #2 can't see the typed secret word
30.times {puts}
# while there are still allowed guesses left 
word_was_guessed=false
while (this_game.number_guesses_left > 0) and (!word_was_guessed)
  # ask player #2 to guess a letter
  puts "Player #2: Please guess a letter: "
  # take first letter entered
  entered_value = gets.chomp.chr 
  # while the entered letter has already been guessed
  while this_game.has_been_guessed?(entered_value)
    # print message
    puts "Letter #{entered_value} has already been guessed. Please guess a new letter: "
    # get another letter
    entered_value = gets.chomp.chr 
  end
  # look for entered letter in word to guess
  if this_game.check_letter(entered_value)
    #   letter found
    #   check to see if all letters found - if so, print congratulatory message with correct word in it, and exit
    if this_game.all_letters_guessed? 
      puts "You are correct. Congratulations. You are truly amazing."
      word_was_guessed = true
    else
      # word not yet completely guessed
      puts "Yay! You got one!"
      puts this_game.show_progress
    end
  else
    # letter not found; tell user and show progress (blanks and correctly guessed characters)
    puts "Boooooooomp. Sorry, no dice."
    puts this_game.show_progress
  end
end
# there are no more allowed guesses left, and the word has not yet been correctly guessed
# print taunting msg with correct word in it, and exit
if !word_was_guessed
  puts "Really. Wow, that is surprising. My cat got this word in just a few guesses."
end


