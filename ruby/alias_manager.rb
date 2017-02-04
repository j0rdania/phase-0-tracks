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

