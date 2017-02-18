/////////////////    RELEASE 0     //////////////////////////////////////
// function that takes an array of words or phrases and returns
// the longest word or phrase in the array. If the function was given the 
// array of ["long phrase","longest phrase","longer phrase"],it would return "longest phrase". 

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


//////////////   RELEASE 1      /////////////////////////////////////////
write a function that takes two objects and checks to see if the objects share at least 
one key-value pair. (You'll keep adding to this file, so we suggest grouping functions 
  at the top and testing at the bottom of the file.) If we called your function with 
{name: "Steven", age: 54} and {name: "Tamir", age: 54}, the function would return true, 
because at least one key-value pair matches between the two objects. If no pairs match 
(and keep in mind that the two objects may not even have any of the same keys), the function 
should return false. 

// declare function that takes two objects as parameters

// cycle through all keys of object1, checking to see if there is a matching key in object2.
// if a matching key is found, if the values for the matching key in object1 and object2 are equal, return true
// otherwise(matching key not found or matching key found but value not equal), continue cycling through the keys
// of object1. if we get all the way through looking at all of object1's keys and no match has been found, return false.












