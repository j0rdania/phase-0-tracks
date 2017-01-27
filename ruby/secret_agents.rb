# * Encrypt *
# - Receive string as input variable
# - For each letter that is in input string:
#   - If letter = "z"
#     - Reassign to "a"
#   - Elsif character is " " (space)
#     - No character reassignment
#   - Else
#     - Reassign to next letter in the alphabet
# - Return new string

def encrypt(in_string)
  for i in 0..(in_string.length - 1)
    if in_string[i] == "z"
      in_string[i] = "a"
    elsif in_string[i] == " " 
    else
      in_string[i] = in_string[i].next
    end
  end
  in_string  
end



# * Decrypt *
# - Receive string as input variable
# - For each character that is in input string:
#   - If character = "a"
#     - Reassign to "z"
#   - Elsif character is " " (space)
#     - No character reassignment
#   - Else
#     - Reassign to previous letter in alphabet
#       - Find index in alphabet
#       - Subtract 1 from index
#       - Get letter that corresponds to new index
# - Return new string 

def decrypt(in_string)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  for i in 0..(in_string.length - 1)
    if in_string[i] == "a"
      in_string[i] = "z"
    elsif in_string[i] == " " 
    else
      in_string[i] = alphabet[alphabet.index(in_string[i]) - 1]
    end
  end
  in_string  
end

# puts decrypt(encrypt("swordfish"))  # The return of the interior method supplies the 
                                    # exterior method with its argument


# DRIVER CODE
response = ""
password = ""
valid_response = false

# Asks user whether they would like to decrypt or encrypt a password
# Repeat until users gives valid response (encrypt or decrypt)
puts "Would you like to decrypt or encrypt a password?"

until valid_response
  response = gets.chomp
  
  if response == "encrypt" || response == "decrypt"
    valid_response = true
  end

  if !valid_response
    puts "Please respond with either 'decrypt' or 'encrypt'."
  end
end


# Reset valid response for repeat use
valid_response = false

# Asks user for the password
# Repeat until users gives valid response (a non-empty string)
puts "What is the password you would like to #{response}?"

until valid_response
  password = gets.chomp
  if !(password.empty?) 
    valid_response = true
  end

  if !valid_response
    puts "Please respond with a non-empty string."
  end
end

# Conduct encrypt or decrypt, based on response
if response == "encrypt"
  puts "Encrypted password: #{encrypt(password)}"
else
  puts "Decrypted password: #{decrypt(password)}"
end
