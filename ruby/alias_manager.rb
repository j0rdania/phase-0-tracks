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
  # is this letter upper case?

end