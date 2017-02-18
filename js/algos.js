/////////////////    RELEASE 0     //////////////////////////////////////

// this function takes an array of words or phrases and returns
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
    if (array_of_phrases[i].length > longest_string.length) {
      longest_string = array_of_phrases[i];
    }
    // if equal, append 'and' plus this array element's value the longest_string variable
    else if(array_of_phrases[i].length === longest_string.length) {
      longest_string = longest_string + ' and ' + array_of_phrases[i];
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

// this function takes two objects and checks to see if the objects share at least one key-value pair.
// returns true if the answer is yes, false if the answer is no

// declare function that takes two objects as parameters
var matching_key_value_pair = function (object1,object2) { 
  // cycle through all keys of object1, checking to see if there is a matching key in object2
  for (var key_x in object1) {
    // cycle through object2, checking to see if the key we are trying to match is present
    for (var key_y in object2) {
      if (key_y === key_x)
        // this key matches key from object1; see if the values for these matching keys in object1 and object2 match
        if (object1[key_x] === object2[key_y]){
          // key and value match; return true
          return true;
        }
    }
  }
  // no matching key/value pairs found
  return false;
}

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

////////////////////   RELEASE 2     /////////////////////////////////////////////

// this function that takes an integer for length 
// and builds/returns an array of that length that will contain random strings of random length (minimum 1 letter, max 10)

// declare function that takes an integer number_entries
var build_array = function(number_entries) {
  // declare an alphabet array
  var alphabet = ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];
  // declare an empty array that we will be returning
  var array_to_return = [];
  // declare a variable to hold random length of a particular word
  var length_of_this_word;
  // declare a variable to hold each new word
  var new_word;
  // declare a variable to hold a random letter
  var random_letter;
  // for each array entry we want to create, build a word
  for (var j = 1; j <= number_entries;j++) {
    // find a random number Y that will be the length of this word - Math.random gives us a floating point 
    // number between 0 and 1, which we can multiply by 10 and round up to get a number between 1 and 10.
    length_of_this_word = Math.ceil(Math.random() * 10);
    // reset new_word
    new_word = '';
    // create a random word of length Y and push it onto array_to_return (to do this we will get Y random letters)
    for (var k = 1; k <= length_of_this_word; k++) {
      // to get a random letter, generate a random # between 0 and 25 (to index the alphabet)
      // to get a random # between 0 and 25, we will take the Math.random number, multiply it by 26, and round down
      random_letter = alphabet[Math.floor(Math.random() * 26)];
      // add random letter to new_word
      new_word = new_word + random_letter;
    }
    // push new word onto array_to_return
    array_to_return.push(new_word);
  }
  return array_to_return
}

///////////////////         DRIVER code     ///////////////////////////

// driver code will do the following 10 times:
//   a. generate an array
//   b. print an array
//   c. feed the array to the 'longest word' function
//   d. print the result
for (var t = 1; t <= 10; t++) {
  // pass a random # between 1 and 10
  var new_array = build_array(Math.ceil(Math.random() * 10));
  console.log(new_array);
  console.log('The longest word is: ' + find_longest_string(new_array));
}
