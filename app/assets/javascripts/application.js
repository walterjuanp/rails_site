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
// We need the jquery migrate plugin because some other plugins use old functions
//= require jquery-migrate-1.2.1.min 
//= require prism
//= require selectize
//= require jquery.flexnav
//= require jquery.jcarousel
//= require jquery.jcarousel-control
//= require magnific-popup/magnific-popup

$(document).ready(function(){
  /* alerts */
 $('div.alert').slideDown();
  $('div.alert').click(function(eventObject){
    $(this).slideUp();
  });
  
  /* flexnav */
  $(".flexnav").flexNav();
  
  /* magnific popup gallery */
  $('.magnific-gallery').each(function() { // the containers for all your galleries
    $(this).magnificPopup({
      delegate: 'a', // the selector for gallery item
      type: 'image',
      gallery: {
        enabled:true
      }
    });
  });
});
