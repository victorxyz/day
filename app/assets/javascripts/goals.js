//# Place all the behaviors and hooks related to the matching controller here.
//# All this logic will automatically be available in application.js.
//# You can use CoffeeScript in this file: http://coffeescript.org/
$('#counter').html('<%= escape_javascript(page_entries_info(@favorites, :remote => true).to_s) %>');


$(document).on('turbolinks:load', function() {
  // Get the modal
  var modal = document.getElementById('myModal10');
  console.log("test1")
  // Get the button that opens the modal
  var btn = document.getElementById("myBtn10");

  // Get the <span> element that closes the modal
  var span = document.getElementsByClassName("close")[1];

  // When the user clicks the button, open the modal
  btn.onclick = function() {
      modal.style.display = "block";
  }

  // When the user clicks on <span> (x), close the modal
  span.onclick = function() {
      modal.style.display = "none";
  }

  // When the user clicks anywhere outside of the modal, close it
  document.onclick = function(event) {
      if (event.target == modal) {
          modal.style.display = "none";
      }
  }
});
