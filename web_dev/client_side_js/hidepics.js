// hide "follow these easy steps" paragraph

var hide_steps = function() { 
  var steps = document.getElementById("follow_steps");
  steps.hidden = true;
 };
hide_steps();

// this function toggles the visibility of the steps element (the "follow these easy steps" paragraph) 
// this function will be called by an event that is triggered when a button is clicked
// if visibility is turned off by this function, the button will get a pink border
// if visibility is turned on by this function, the button's border will be removed
function toggle_visibility(event) {
  var steps_text_object = document.getElementById("follow_steps");
  if (steps_text_object.hidden) {
    steps_text_object.hidden = false;
    event.target.style.border = "";
  }
  else {
    steps_text_object.hidden = true;
    // also, put a border around the button
    event.target.style.border = "2px solid pink";
  }
};

// grab button element and place in variable
var toggle_button = document.getElementById("follow_steps_button");
// add event listener
toggle_button.addEventListener("click",toggle_visibility);

