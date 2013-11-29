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
// Change "require_tree ." for "require_directory ." for discard the bo
// If you add more dire you need add new lines for "require_directory exemple_dir_name"
//= require_directory .
//= require bootstrap
//= require ../prism
//= require ../autogrow
//= require selectize

$(document).ready(function(){
  /*
   * Fixed Action Buttons
   */
  if( $('div.action-buttons').length == 1 ){
    $('div.action-buttons').after('<div class="fake-action-buttons"></div>');
  
    $(window).scroll(function(event){
      var bodyOffset = $('body').scrollTop() + 70; // the 70 is for header
      var btnOffset = $('div.action-buttons').offset().top;
      var btnFakeOffset = $('div.fake-action-buttons').offset().top;
      
      if( btnFakeOffset >= btnOffset && btnFakeOffset >= bodyOffset ){
        $('div.action-buttons').removeClass('fixed-action-buttons');
      }else{
         $('div.action-buttons').addClass('fixed-action-buttons');
      }
      
    });
  }
});