/* eslint no-console:0 */
// This file is automatically compiled by Webpack, along with any other files
// present in this directory. You're encouraged to place your actual application logic in
// a relevant structure within app/javascript and only use these pack files to reference
// that code so it'll be compiled.
//
// To reference this file, add <%= javascript_pack_tag 'application' %> to the appropriate
// layout file, like app/views/layouts/application.html.erb

// Rails functionality
window.Rails = require("@rails/ujs")
require("turbolinks").start()
require("@rails/activestorage").start()
require("channels")
require("trix")
require("@rails/actiontext")

// Tailwind CSS
import "stylesheets/application"

// Stimulus controllers
import "controllers"

// Jumpstart Pro & other Functionality
import "src/actiontext"
import "src/confirm"
import "src/direct_uploads"
import "src/forms"
import "src/timezone"
import "src/tooltips"

import LocalTime from "local-time"
LocalTime.start()

// ADD YOUR JAVACSRIPT HERE

// Add Choices Dropdown
const ChoicesForOutfitItems = require('choices.js')
document.addEventListener("turbolinks:load", function() {
  var dropDownSelects = new ChoicesForOutfitItems('#outfit-item')

  // Passing a function that returns Promise of choices
  dropDownSelects.setChoices(async () => {
    try {
      const items = await fetch('/accessories');
      return items.json();
    } catch (err) {
      console.error(err);
    }
  });
})

// Start Rails UJS
Rails.start()
