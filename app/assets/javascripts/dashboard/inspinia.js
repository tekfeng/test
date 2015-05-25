// Custom scripts
$(document).on('page:change', function() {
  $('#side-menu').metisMenu();  
  onWindowResize();
});

$(document).on('ready', function() {
  // MetsiMenu
  $('#side-menu').metisMenu();

  // tooltips
  $('.tooltip-demo').tooltip({
    selector: "[data-toggle=tooltip]",
    container: "body"
  })

  // Move modal to body
  // Fix Bootstrap backdrop issu with animation.css
  $('.modal').appendTo("body")

  // Full height of sidebar
  function fix_height() {
    var heightWithoutNavbar = $("body > #wrapper").height() - 61;
    $(".sidebard-panel").css("min-height", heightWithoutNavbar + "px");
    var windowWidth = $( window ).height();
    $("#page-wrapper").css("min-height", windowWidth + 'px');
  }
  fix_height();

  // Fixed Sidebar
  // unComment this only whe you have a fixed-sidebar
  $(window).bind("load", function() {
    if($("body").hasClass('fixed-sidebar')) {
      $('.sidebar-collapse').slimScroll({
        height: 'auto',
        railOpacity: 0.9,
      });
    }
  });

  $(window).bind("load resize click scroll", function() {
    if(!$("body").hasClass('body-small')) {
      fix_height();
    }//end if
  })

  $("[data-toggle=popover]").popover();
});


// Collapse ibox function
$(document).on('click', '.collapse-link', function() {
  var ibox = $(this).closest('div.ibox');
  var button = $(this).find('i');
  var content = ibox.find('div.ibox-content');
  content.slideToggle(200);
  button.toggleClass('fa-chevron-up').toggleClass('fa-chevron-down');
  ibox.toggleClass('').toggleClass('border-bottom');
  setTimeout(function () {
      ibox.resize();
      ibox.find('[id^=map-]').resize();
  }, 50);
});

// Close ibox function
$(document).on('click', '.close-link', function() {
  var content = $(this).closest('div.ibox');
  content.remove();
});

// Small todo handler
$(document).on('click', '.check-link', function() {
  var button = $(this).find('i');
  var label = $(this).next('span');
  button.toggleClass('fa-check-square').toggleClass('fa-square-o');
  label.toggleClass('todo-completed');
  return false;
});

// minimalize menu
$(document).on('click', '.navbar-minimalize', function(event) {
  event.preventDefault();
  $("body").toggleClass("mini-navbar");
  window.lastNavbarState = $("body").hasClass('mini-navbar');
  SmoothlyMenu();
});

function SmoothlyMenu() {
  if (!$('body').hasClass('mini-navbar') || $('body').hasClass('body-small')) {
    // Hide menu in order to smoothly turn on when maximize menu
    $('#side-menu').hide();
    // For smoothly turn on menu
    setTimeout(function () {
      $('#side-menu').fadeIn(500);
    }, 100);
  } else if ($('body').hasClass('fixed-sidebar')){
    $('#side-menu').hide();
    setTimeout(function () {
      // $('#side-menu').fadeIn(500);
    }, 300);
  } else {
    // Remove all inline style from jquery fadeIn function to reset menu state
    $('#side-menu').removeAttr('style');
  }
}

$(window).bind("load resize", onWindowResize);

function onWindowResize() {
  if ($(window).width() < 769) {
    if (!$("body").hasClass('mini-navbar')) {
      $('body').addClass('body-small');      
    }//end if
  } else {
    $('body').removeClass('body-small');
  } 
}