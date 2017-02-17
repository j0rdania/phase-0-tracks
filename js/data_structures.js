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

// RESERACH RESULTS
// If you wanted to loop through the keys and values of an object, how would you do that? (There are a few ways to accomplish this, and some gotchas that can happen depending on your approach.)

// method A:  You could use a for...in loop:
// for (proprety_var in object_name) {
//   code here  - property_var is the property name for this element; the value for this element may be accessed 
//   by using object_name[property_var]
// }
// the for...in loop will iterate over enumerable properties, which include properties from the prototype 
// (inherited properties); so you would need to use the .hasOwnProperty attribute of each property
// to make sure you want to include the property in your processing. 
// Also, with this technique, the order will be arbitrary, so this technique would not work if you cared about the order.
// 
// method B:
// you could use Object.keys(obj), which lists all enumerable own property keys of an object. 
// It returns an array of all of the object's keys, so you could then use a for loop to step through the array
//
// method C:
// you could use Object.getOwnPropertyNames(), which lists all own property keys of an object, including the non-enumerable ones.
// but you'd have to weed out the non-enumerables if you didn't want them.



// Are there advantages to using constructor functions to create objects? Disadvantages? 
// Constructor functions allow you to easily create many objects of one type. The new objects that are created will have 
// specific properties, and default values can be set. If you define a method inside the constructor, it will get
// re-declared each time a new instance is created, which has memory implications(you can use prototype method, instead, to avoid this, but then the method would
// not have access to local private variables.) A simple literal object (with no methods) might be better than using a constructor function, which is slightly more
// complicated. Also, it appears there are implications about private vs. public access - a literal object declaration will be public.



