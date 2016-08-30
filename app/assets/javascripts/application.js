//= require jquery
//= require jquery_ujs
//= require bootstrap.min
//= require jquery.turbolinks
//= require turbolinks
//= require_tree .


$(function(){
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
    $('.lightbox').fadeOut();
  });

  setTimeout(function(){
    $('.alert-info').fadeOut(500);
  }, 3000);

  $('.evaluate').text("☆");
});

