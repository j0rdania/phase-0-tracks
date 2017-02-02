#####  RELEASE 0  #######
# declare array with some initial values
array = [ 
  2,
  5,
  11, 
  3,
  88,
  9
  ]

# define method to search a given array for a given integer
def search_array(array_to_search,int_to_find) 
  # initialize position in array variable
  position = 0 
  # for each element in the array, look for integer
  array_to_search.each do |i|
    # if this integer = what we are trying to find, return the position in the array
    if i == int_to_find
      return position 
    else
      # integer not found, increment position and try again
      position += 1 
    end
  end
  # if we reached this part of the code, the integer was not found after the entire array was searched; return nil
  nil
end

# test
puts "Results of search_array method 88 : #{search_array(array,88)}"
puts "Results of search_array method 6: #{search_array(array,6)}"



####  RELEASE 1   ########
#define method to create fibonacci Array
def fib(int_to_process)
  # initialize fib array with first two elements 
  fib_array = [0,1]
  # start at index position 2 since first two elements have already been inserted
  index = 2
  # execute this block of code int_to_process less 2 that have already been inserted
  (int_to_process - 2).times do
    # get value two positions back
    value_2_back = fib_array[index -2]
    # get value one position back
    value_1_back = fib_array[index -1]
    # add those two values 
    total_of_last_two_elements = (value_1_back + value_2_back)
    # insert the sum into fib_array
    fib_array.push(total_of_last_two_elements)
    # increment index
    index += 1
  end
  # return fib_array that was created
  fib_array
end 

#test 
puts "Fib(6): #{fib(6)}" 
puts "Fib100: #{fib(100).last}"
