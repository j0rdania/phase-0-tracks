//reverse function
// this function will take a string as input and return that string in reverse order
// for example, "hello" would be returned as "olleh"

  /*  create an array of characters that holds the characters in the string passed in, in their original order
      create a result string variable that starts as an empty string
      for each element in the array, starting at the end of the array, add the letter in the array to our result string
      continue until the 1st element of the array has been added to our result string
      return the result string */

var reverse = function(input_string) {
  // create a result string variable that starts as an empty string
  var result_string = '';
  // create array of characters in the input_string
  var input_array = input_string.split('');
  // subtract one from the length of the array because of zero indexing
  // start at end of array, continue until we've processed the first array
  // element, and decrement the index each iteration
  for (var i = (input_array.length - 1); i >= 0; i--) {
      result_string = result_string.concat(input_array[i]);
  }
  return result_string;
};

////////////  DRIVER CODE    ///////////////////////
var reversed_string = reverse('hello');
var jordan_likes_java = true;
if (jordan_likes_java) {console.log(reversed_string)}

