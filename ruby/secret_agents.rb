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

