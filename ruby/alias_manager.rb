# 5.5
# Release 0
# take a spy's real name and create a fake name by
# a. swap the first and last name
# b. change all vowels to the next vowel
# c. change all consonants to the next consonant


def is_vowel? (letter)
  # if the letter passed in is a vowel, return true. otherwise, return false
  case letter
    when 'a','e','i','o','u'
      true
    else 
      false
    end
end

def is_upper? (letter)
  # if the letter passed in is the same as the upper case version of that letter,
  # it IS an upper case letter so return true
  # otherwise, it is not so return false
  if letter == letter.upcase
    true
  else
    false
  end if
end

def get_next_vowel (vowel_to_change)
  # this method will take a vowel and return the next sequential vowel
  # u will become a
  # case will be preserved

  # record upper case status
  upper_case_status=is_upper?(vowel_to_change)
  # convert to lower case for determining next vowel
  vowel_to_change= vowel_to_change.downcase
  new_letter=''
  case vowel_to_change
    when 'a'
      new_letter='e'
    when 'e'
      new_letter='i'
    when 'i'
      new_letter='o'
    when 'o'
      new_letter='u'
    when 'u'
      new_letter='a'
  end
  # convert letter back to upcase if it was upper case initially
  if upper_case_status then
    new_letter.upcase 
  else
    new_letter
  end 
end

def get_next_letter (letter_to_change)
  # this method will get the next sequential vowel if this is a vowel
  # if this is a consonant, this method will return the next sequential consonant
  # z and Z become a and A, respectively
  # case will be preserved

  # record upper case status
  upper_case_status=is_upper?(letter_to_change)
  # convert to lower case for determining next vowel
  letter_to_change=letter_to_change.downcase
  new_letter=''
  case letter_to_change
    when 'z'
      new_letter='a'
    when is_vowel?
      new_letter=letter_to_change.get_next_vowel(letter_to_change)
    else
      new_letter=new_letter.next
  end
  # convert letter back to upcase if it was upper case initially
  if upper_case_status then
    new_letter.upcase 
  else
    new_letter
  end 
end

def swap_two_words (in_word)
  # this method will take a string with two words and swap the two words - assumes there is one space between exactly two words
  # return a string with the two words swapped

  # convert string of two words to array with two elements: word1 in element 0 and word2 in element 1
  word_holder=in_word.split(' ')
  # swap array positions so that word1 will now be in element1 and word2 will now be in element 0
  word1=word_holder[0]
  word2=word_holder[1]
  word_holder[0]=word2
  word_holder[1]=word1
  # put words back together into a string (there will be a space between the two words)
  word_holder.join(' ')
end