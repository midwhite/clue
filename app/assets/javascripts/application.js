// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .
//= require fancybox



$(document).ready(function() {
  
  $('#supporters_lightbox').click(function(){
    $('.lightbox').fadeOut();
    $('#search_supporters').fadeIn();
  });
  
  $('#students_lightbox').click(function(){
    $('.lightbox').fadeOut();
    $('#search_students').fadeIn();
  });
  
  $('#mypage_menu').click(function() {
      $('.lightbox').fadeOut();
      $('#my_page_menu').fadeIn();
  })
  
  $('.lightbox, .lightbox_button').click(function() {　event.stopPropagation();　});
  $(document).click(function() {
    console.log("閉じるよ");
    $('.lightbox').fadeOut();
    
  });
  
  /*
  $("a.fancybox").fancybox({
    'width': 700,
    'height': 400,
    'margin': 20,
    'padding': 10,
    'topRatio': 0.1,
    'scrolling': 'auto',
    'autoSize': false
  });
  */
});

$(function(){
  window.setTimeout(function(){
    $('.alert-info').fadeOut(500);
  }, 3000);
});

$(function(){
  $('.evaluate').text("☆");
});
