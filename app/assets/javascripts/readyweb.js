var ready;
ready = function() {

  // Smooth Scroll
  $(function() {
    $('a[href*=#]').bind("click", function() {
      // check if go to the same page but different div hash
      if (location.pathname.replace(/^\//,'') == this.pathname.replace(/^\//,'') && (location.hostname == this.hostname)) {
        var target = $(this.hash);
        if(target.length == 0) {
          if(this.hash) {
            target = $('*[name=' + this.hash.slice(1) +']');
          } else {
            return true;
          }
        }//end if
        
        if (target.length) {
          $('html,body').animate({
            scrollTop: target.offset().top
          }, 1000);
          return false;
        }
      }
    });
  });

  // Menu
  menu = $('nav ul');

  $('#openup').on('click', function(e) {
    e.preventDefault(); 
    menu.css({
      "paddingTop" : 120
    });
    menu.find(".icon-facebook-squared").parents("li").eq(0).toggle();
    menu.slideToggle();
  });
  
  $(window).resize(function(){
    // var w = $(this).width(); if(w > 480 && menu.is(':hidden')) {
    var w = $(this).width(); 
    if(w >= 800 && menu.is(':hidden')) {
      menu.removeAttr('style');
    }
  });
  
  $('nav li').on('click', function(e) {                
    var w = $(window).width(); if(w <= 800 ) {
      menu.find(".icon-facebook-squared").parents("li").eq(0).toggle();
      menu.slideToggle(); 
    }
  });
  $('.open-menu').height($(window).height());

  // slider
  $('.slider').slider();
  
};

$(document).ready(ready);
$(document).on('page:load', ready);