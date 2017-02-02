array = [ 
  2,
  5,
  11, 
  3,
  88,
  9
  ]


def search_array(array_to_search,int_to_find)
  position = 0 
  array_to_search.each do |i|
    if i == int_to_find
      return position 
    else
      position += 1 
    end
  end
  nil
end

puts "Results of search_array method 88 : #{search_array(array,88)}"
puts "Results of search_array method 6: #{search_array(array,6)}"