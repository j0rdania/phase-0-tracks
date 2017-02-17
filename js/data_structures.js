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

// constructor function for car
function Car(make,model,year,color) {
  this.make = make;
  this.model = model;
  this.year = year;
  this.color = color;
  this.go = function() {console.log('The ' + this.year + ' ' + this.make + ' ' + this.model + ' is on its way!');};
}
// declare array of makes
var makes = ['Acura','Toyota','GM'];
// declare array of models
var models = ['Torpedo','Slowpoke','Muffler Madness'];
// declare array of years
var years = [1994,2012,2017];
// declare array of colors
var colors = ['blue','black','red']

// crank out some cars to sell; put them in an array of cars
// declare empty array of cars for sale
var cars_for_sale = [];
for (var i = 0; i < makes.length; i++) {
  cars_for_sale.push(new Car(makes[i],models[i],years[i],colors[i]));
  console.log(cars_for_sale[i]);
  cars_for_sale[i].go();
}
