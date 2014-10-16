// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
// WARNING: THE FIRST BLANK LINE MARKS THE END OF WHAT'S TO BE PROCESSED, ANY BLANK LINE SHOULD
// GO AFTER THE REQUIRES BELOW.
//
//= require jquery
//= require jquery_ujs
//= require_tree .

$( document ).ready(function() {
  
  
  function scrollY(){
    $('html, body').animate({
              scrollTop: $('#pages-form').offset().top
          }, 700); 
  }
   $('#pages-index').find('a').on("click", function() {
    scrollY();
  });
  $('header').find('#signup').on("click", function() {
   scrollY();
 });
 
 
  function toggleDivs() {
      var $inner = $("#inner");

      // See which <divs> should be animated in/out.
      if ($inner.position().left == -400) {
          $inner.animate({
              left: "-200px"
          });
      }
      else {
          $inner.animate({
            left: "-400px"
          });
      }


  }

  $("#menu-button").bind("click", function() {
      toggleDivs();
  });
});
