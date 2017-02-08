# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
def create_list(list_name,list_of_items)
  # create empty array
  list_name = []
  # for each item in string, use add item method to add item to grocery list (set default quantity to 1)
  shopping_items = list_of_items.split(' ')
  shopping_items.each do |thing_to_add|
    add_item_to_list(list_name,thing_to_add,1)
  end
  # print the list to the console
  print_list(list_name)
end 
# output: [array]

# Method to add an item to a list
# input: list, item name, and optional quantity
def add_item_to_list(list_name,item_to_add,quantity_to_add = 1)
#create a hash element with the item name and the quantity, if specified
#if no quantity is specified, default value = 1
  new_item = { 
    item_name:  item_to_add,
    quantity:   quantity_to_add
    }
# insert the hash into array 
  list_name.push(new_item)
  new_item
end
# output: hash with item's name and quantity

# Method to remove an item from the list
# input: list name, name of item to remove
  def remove_item(list_name,item_to_remove)
    #find all array elements in given list with the given item name and delete them
    list_name.delete_if { |x| x[:item_name] == item_to_remove}
  end 
# output: new array with item removed

# Method to update the quantity of an item
# input: list name, name of item
def update_quantity(list_name,item_name_to_adjust,new_quantity)
#find all array elements in given list with the given item name
  list_name.each do |array_item|
    if array_item[:item_name] == item_name_to_adjust
      #set the quantity to the new specified quantity
    array_item[:quantity] = new_quantity
    end 
  end 
end 
#output: hash with the item's name and new quantity

# Method to print a list and make it look pretty
# input: list name
def print_list(list_name)
# for each array element, print the item name and quantity
  list_name.each { |list_item| puts "#{list_item[:item_name]}" + ':  ' + "#{list_item[:quantity]}"}
# Wish the shopper good luck.
  puts "Happy Shopping!"
  list_name
end
# output: array with all items on list

# jordan_list = [
#       { item_name: 'apples',
#         quantity: 3
#       },
#       { item_name: 'bananas',
#        quantity: 2
#       }
#     ]

#   add_item_to_list(jordan_list,'carrots',4)
#   update_quantity(jordan_list,'carrots',76)
#   remove_item(jordan_list,'carrots')
#   add_item_to_list(jordan_list,'candybars')
#   puts "Our awesome method:"
#   print_list(jordan_list)

# Test Driver Code (Release 2): 
  linsey_list = create_list('linsey_list','eggs milk cucumbers sausages')
  add_item_to_list(linsey_list,'Lemonade',2)
  add_item_to_list(linsey_list,'Tomatoe',3)
  add_item_to_list(linsey_list,'Onion')
  add_item_to_list(linsey_list,'Ice Cream',4)
  puts "-----------" 
  print_list(linsey_list)
  puts "-----------"
  remove_item(linsey_list, 'Lemonade')
  print_list(linsey_list)
  puts "-----------"
  update_quantity(linsey_list, 'Ice Cream', 1)
  print_list(linsey_list)

  Jordan's Reflection Section - Release 4
  1. I learned that writing detailed pseudocode makes the coding fall right into place;
  it lets me concentrate on synatax rather than having to think through the logic.
  2. We found the hashes to be tricky to access. We choose an array of hashes, and to search for an array element
  with a particular hash key, we had to cycle through all of the array elements - a bit cumbersome. We had hoped to use
  a built-in method.
  3. A method returns the value of its last executed expression, unless another value is explicity returned using RETURN x 
  4. You can pass any object into a method as an argument: a string, an integer, an array, a hash item, or a code block.
  5. To pass information between methods, you either need to call one method from within another method, or else use parameters/arguments.
  6. I learned some good tips from our guide about formatting conventions. I also had a lot of fun with my pair. 
  2. 