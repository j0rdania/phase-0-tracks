// write a function that takes an array of words or phrases and returns
// the longest word or phrase in the array. So if we gave your 
// function the array of ["long phrase","longest phrase","longer phrase"],
// it would return "longest phrase". This is a logical reasoning challenge, 
// so try to reason through this based on what you already know, 
// rather than Googling the fanciest solution or looking up built-in 
// sorting functions. Note that "some string".length will do what you 
// expect in JS.
// Add driver code that tests your function on a few arrays.


// declare function, accepting an array of words/phrases as an input parameter
var find_longest_string = function (array_of_phrases) {
  // declare longest_string variable and set to the empty strin
  //console.log('in function find_longest_string; input array is: ' + array_of_phrases);
  var longest_string = '';
  // cycle through the array, starting at the beginning, and continuing to the end of the array
  for (var i = 0; i < array_of_phrases.length; i++) {
    // compare each array element's length to the longest_string's length;
    // if longer, set the longest_string variable to this array element's value
    //console.log('in for loop, array entry is: ' + array_of_phrases[i]);
    if (array_of_phrases[i].length > longest_string.length) {
      longest_string = array_of_phrases[i];
    }
  }
// return the longest_string
return longest_string
}
 
/////////    DRIVER code       /////////////
console.log('soooooo long results: ' + find_longest_string(['hello','i am soooooooo long','hi','greetings']));
console.log('empty array results: ' + find_longest_string([]));
console.log('longest at end of array results: ' + find_longest_string(['i am short','me too','not me I am super long']));
console.log('longest at begin of array results:' + find_longest_string(['very very long','short']));
console.log('only one element results: ' + find_longest_string(['just me']))  ;

