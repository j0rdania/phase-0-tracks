
require_relative 'hangman.rb'

describe 'test_hangman_class' do

  # create a new instance of Hangman class - set word to guess to umbrella
  let(:test_hangman){Hangman.new('umbrella')}

  it "upon initialization, puts the word to guess in an array of characters" do 
    expect(test_hangman.word_to_guess.join).to eq 'umbrella'
  end

  it "upon initialization, sets the number of guesses left attribute to the length of the word to guess" do
    expect(test_hangman.number_guesses_left).to eq 8
  end

  it "upon initialization, creates an empty array of hashes to hold guessed letters and if each letter is correct or not" do
    expect(test_hangman.letters_tried.length).to eq 0
  end

  it "gets the word to guess" do 
    expect(test_hangman.get_word).to eq 'umbrella'
  end 

  it "creates a string with guessed letters and blanks when a correct letter is guessed" do 
    test_hangman.check_letter('a')
    expect(test_hangman.show_progress).to eq '_______a'
  end

  it "creates a string with guessed letters and blanks when a correct letter with multiple occurrences is guessed" do 
    test_hangman.check_letter('l')
    expect(test_hangman.show_progress).to eq '_____ll_'
  end

  it "creates a string with guessed letters and blanks when an incorrect letter is guessed" do 
    test_hangman.check_letter('c')
    expect(test_hangman.show_progress).to eq '________'
  end

  it "determines if a particular letter has already been guessed when the answer is no" do 
    expect(test_hangman.has_been_guessed?('t')).to eq false
  end

  it "determines if a particular letter has already been guessed when the answer is yes" do 
  # note: this will also test to make sure that the letters_tried array was populated when a letter is checked
    test_hangman.check_letter('t')
    expect(test_hangman.has_been_guessed?('t')).to eq true
  end

  it "determines if a letter is in the word to guess when the answer is no" do
    expect(test_hangman.check_letter('p')).to eq false
  end

  it "determines if a letter is in the word to guess when the answer is yes" do
   expect(test_hangman.check_letter('a')).to eq true
 end

  it "decrements the number of guesses left attribute when the user guesses wrong unique letter" do 
    test_hangman.check_letter('q')
    expect(test_hangman.number_guesses_left).to eq 7
  end

# commented out because this logic resides in driver code
  # it "does not decrement the number of guesses left attribute when the user guesses a letter already guessed" do 
  #   test_hangman.check_letter('a')
  #   test_hangman.check_letter('a')
  #   expect(test_hangman.number_guesses_left).to eq 
  # end

  it "determines if all of the letters of the word have been correctly guessed when the answer is yes" do 
    # all letters guessed and also q incorrectly guessed
    # this test will also determine if the status of the letters_tried array is correctly set
    test_hangman.check_letter('u')
    test_hangman.check_letter('l')
    test_hangman.check_letter('m')
    test_hangman.check_letter('a')
    test_hangman.check_letter('q')
    test_hangman.check_letter('b')
    test_hangman.check_letter('e')
    test_hangman.check_letter('r')
    expect(test_hangman.all_letters_guessed?).to eq true
  end

  it "determines if all of the letters of the word have been correctly guessed when the answer is no" do 
    # missing u; q also incorrectly guessed
    test_hangman.check_letter('l')
    test_hangman.check_letter('m')
    test_hangman.check_letter('a')
    test_hangman.check_letter('q')
    test_hangman.check_letter('b')
    test_hangman.check_letter('e')
    test_hangman.check_letter('r')
    expect(test_hangman.all_letters_guessed?).to eq false
  end
end

