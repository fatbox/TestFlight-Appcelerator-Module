//
// TestFlight Titanium Module - Test App
//
// Copyright 2011 FatBox Inc.
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
//
// @author Brodie Hanbuch <brodie@fatbox.ca>
// @author Evan Borgstrom <evan@fatbox.ca>
//

// Load the module
var testflight = require('ca.fatbox.testflight');

// Take off!
// This is our test key, feel free to replace with your team
// key to see the results of these tests
testflight.takeOff("e8a0c50bdbe05f4d032addfb23863a40_Mzk3MTIyMDExLTExLTE4IDE0OjM3OjI4LjI4OTgyMg");

// Create some simple controls to test things out.
var window = Ti.UI.createWindow({
	backgroundColor:'white'
});
var view = Ti.UI.createView({
    left: 0,
    right: 0,
    top: 0,
    bottom: 0,
    layout: 'vertical'
});

var buttonFactory = function(label) {
    return Ti.UI.createButton({
        top: 10,
        left: 10,
        right: 10,
        text: label
    });
};

var button1 = buttonFactory("Pass checkpoint");
var button2 = buttonFactory("Test Exception");
var button3 = buttonFactory("Launch Feedback");

button1.addEventListener('click', function() { testflight.passCheckpoint("Test Checkpoint"); });
button2.addEventListener('click', function() { testflight.testException(); });
button3.addEventListener('click', function() { testflight.launchFeedback(); });

view.add(button1);
view.add(button2);
view.add(button3);

window.add(view);
window.open();

