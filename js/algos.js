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
// function that takes two objects and checks to see if the objects share at least one key-value pair.
// returns true if the answer is yes, false if the answer is no

// declare function that takes two objects as parameters
var matching_key_value_pair = function (object1,object2) {
  // cycle through all keys of object1, checking to see if there is a matching key in object2.
  for (var key_x in object1) {
    // cycle through object2, checking to see if the key we are trying to match is present
    for (var key_y in object2) {
      if (key_y === key_x)
        // this key matches key from object1; see if the values match
        if (object1[key_x] === object2[key_y]){
          // key and value match; return true
          return true;
        }
    }
  }
  // no matching key/value pairs found
  return false;
}

// cycle through all keys of object1, checking to see if there is a matching key in object2.
// if a matching key is found, if the values for the matching key in object1 and object2 are equal, return true
// otherwise(matching key not found or matching key found but value not equal), continue cycling through the keys
// of object1. if we get all the way through looking at all of object1's keys and no match has been found, return false.

/////////   DRIVER code  ////////////////
// test matching key but no matching value 
var object1 = {
  name: 'Jordan',
  age: 49,
  status: 'awesome'
};
var object2 = {
  name: 'Jill',
  age: 50,
  status: 'very awesome'
};
console.log('matching key but no matching value result (should be false): ' + matching_key_value_pair(object1,object2) )

// test no matching key but matching value
var object2 = {
  first_name: 'Jordan',
  age_x: 50,
  status_x: 'very awesome'
};
console.log('no matching key but matching value result (should be false): ' + matching_key_value_pair(object1,object2) )

// test matching key and value - first position
var object2 = {
  name: 'Jordan',
  age: 55,
  status_x: 'very awesome'
};
console.log('matching key and value result - first position (should be true): ' + matching_key_value_pair(object1,object2) )

// test matching key and value - last position
var object2 = {
  name: 'Jordan_x',
  age: 50,
  status: 'awesome'
};
console.log('matching key and value result - last position (should be true): ' + matching_key_value_pair(object1,object2) )





