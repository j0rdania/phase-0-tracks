// declare array of horse colors with four values
var horse_colors = ['tan','brown','black','white'];
// declare array of horse names with four values
var horse_names = ['Ed','Mary','Joe','Pickles'];

// add another color to the horse color array
horse_colors.push('purple');

// add another name to the horse name array
horse_names.push('Bozo');

// test
// console.log('length of color array is ' + horse_colors.length);

// use two arrays to create a horses object
// the keys of the object will be horse names, and the values will be colors

// create empty horses object (horse names will be keys and colors will be values)
var horses = {};
// get length of horse names array
var horse_names_length = horse_names.length;
// get length of horse colors array
var horse_colors_length = horse_colors.length;
// make sure lengths are the same
if (horse_names_length === horse_colors_length) {
  // lengths are the same; create the horses object
  for (var i = 0; i < horse_colors_length; i++) {
    horses[horse_names[i]] = horse_colors[i];
  }
}

// test
console.log('Bozo color in horses object is: '+ horses['Bozo']);

