// This is a test harness for your module
// You should do something interesting in this harness 
// to test out the module and to provide instructions 
// to users on how to use it by example.


// open a single window
var window = Ti.UI.createWindow({
	backgroundColor:'white'
});
var label = Ti.UI.createLabel();
window.add(label);
window.open();

// TODO: write your module tests here
var testflight = require('ca.fatbox.testflight');

testflight.takeOff("e8a0c50bdbe05f4d032addfb23863a40_Mzk3MTIyMDExLTExLTE4IDE0OjM3OjI4LjI4OTgyMg");
testflight.explode();

