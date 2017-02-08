# Method to create a list
# input: string of items separated by spaces (example: "carrots apples cereal pizza")
# steps: 
  # create empty array
  # for each item in string, use add item method to add item to grocery list (set default quantity to 1)
  # print the list to the console [can you use one of your other methods here?]
# output: [array]

# Method to add an item to a list
# input: list, item name, and optional quantity
# steps:
#   create a hash element with the item name and the quantity, if specified
#   insert the hash into array 
# output: hash with item's name and quantity

# Method to remove an item from the list
# input: list name, name of item to remove
# steps:
#     find all array elements in given list with the given item name
#     delete them
# output: new array with item removed

# Method to update the quantity of an item
# input: list name, name of item
# steps:
#     find all array elements in given list with the given item name
#     set the quantity to the specified quantity
# output: hash with the item's name and new quantity

# Method to print a list and make it look pretty
# input: list name
# steps:

def print_list(list_name)
#     for each array element, print the item name and quantity
      list_name.each { |list_item| puts "#{list_item[:item_name]}" + ':  ' + "#{list_item[:quantity]}"}
#     Wish the shopper good luck.
      puts "Happy Shopping!"
end
# output: array with all items on list

jordan_list = [
      { item_name: 'apples',
        quantity: 3
      },
      { item_name: 'bananas',
       quantity: 2
      }
    ]




  puts jordan_list
  puts "Our awesome method:"
  print_list(jordan_list)