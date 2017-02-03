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

#####   RELEASE 2  #########
## bubble sort method 
## sort an array of numbers so that they are in sequential order, L to R
## return the sorted array 

## start with the leftmost array element 
## compare it to its next door right neighbor and swap if necessary
## repeat, moving to the right of the array, until the "next door right neighbor" just
## processed was the last element to be sorted - that element is now "sorted" and does
## not need to be visited again - this is one iteration

## iterate, sorting to one less array position each time. 
## the last iteration will be when position one and two are compared and position 2 has been delcared "sorted"

def bubble_sort(array)
  # get number of elements in array to sort
  array_length=array.length
  # for the first iteration we need to go all the way to the last element of the array
  total_compares_to_do_this_iteration = array_length -1
  
  while total_compares_to_do_this_iteration >=1 
    # start new iteration 
    # start at first element 
    left_index=0 
    # go to the right, comparing each set of numbers along the way and swapping if necessary; stop when we have reached the last "already sorted" element 
    while left_index <= (total_compares_to_do_this_iteration -1) do
      if array[left_index] > array[left_index + 1]
        # value on right exceeds value on left, swap
        value1 = array[left_index]
        value2 = array[left_index + 1]
        array[left_index] = value2
        array[left_index + 1] = value1
      end 
      # increment left index so that we keep moving to the right for our compares
      left_index += 1 
    end 
    # decrement total compares  - one less for next iteration since the rightmost value
    # in this iteration has been declared "sorted"
    total_compares_to_do_this_iteration = (total_compares_to_do_this_iteration - 1)
  end
  # return array
  array
end

# test
list_of_numbers_to_sort = [3,5,2,1,12,3,2]
puts "list of numbers to sort prior to sort method: #{list_of_numbers_to_sort}"
puts "#{bubble_sort(list_of_numbers_to_sort)}" 
