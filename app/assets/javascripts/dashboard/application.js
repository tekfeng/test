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
//= require jquery/jquery-2.1.1.js
//= require jquery_ujs
//= require bootstrap-sprockets
//= require metisMenu/jquery.metisMenu.js
//= require slimscroll/jquery.slimscroll.min.js
//= require dropzone/dropzone.js
//= require iCheck/icheck.min.js
//= require toastr/toastr.min.js
//= require ekko-lightbox/ekko-lightbox.js
//= require ./libraries/jquery.cookie.js
//= require nprogress
//= require nprogress-turbolinks
//= require summernote/summernote.min.js
//= require ./select_box/jquery.selectbox-0.2.js
//= requite customer/customers
//= require formnestic/formnestic
//= require dashboard/selectordie.js
//= require dashboard/jquery.datetimepicker.js
//= require dashboard/moment.min.js
//= require dashboard/fullcalendar.js
//= require dashboard/jquery.fancybox-1.3.4
//= require dashboard/jquery.selectbox-0.2
//= require dashboard/jquery.timeago
//= require dashboard/sweet-alert
//= require smart_listing
 
$(document).ready(function() {
  
  $(document.body).delegate("#submit_comment", "click", function(e){
      e.preventDefault();
      var url = $(this).data('url');
      $(this).html('Submiting...');
      $(this).attr('disabled', 'disabled');
      var self = this;
      $.ajax({
        url: url,
        type: "POST",
        data:{
          content: $("#comment_input").val()
        },
        success: function(data){
          $(self).removeAttr('disabled');
          $(self).html('Post Comment');
          $("#comment_input").val("");
          $('#comment_listings').append(data);
          $(".timeago").timeago();
          $(".timeago").prepend("<i class='fa fa-clock-o'></i>");
          var new_count = parseInt($("p#comment_count").data('count')) + 1;
          $("p#comment_count").data('count', new_count);
          $("p#comment_count").html("Comments ("+ new_count +")");
        },
        error: function(data){
          $(self).html('Post Comment');
          $(self).removeAttr('disabled');
          swal("Error!", data.responseJSON.reason , "error");
          
        }
      });
  });
  
  $(".timeago").timeago();
  $(".timeago").prepend("<i class='fa fa-clock-o'></i>");
  
  
});



Dropzone.autoDiscover = false;

NProgress.configure({
  showSpinner: true,
  ease: 'ease',
  speed: 500,
  parent: '#page-wrapper'
});

toastr.options = {
  "closeButton": true,
  "debug": false,
  "newestOnTop": false,
  "progressBar": true,
  "positionClass": "toast-top-right",
  "preventDuplicates": false,
  "showDuration": "300",
  "hideDuration": "300",
  "timeOut": "2000",
  "extendedTimeOut": "1000",
  "showEasing": "swing",
  "hideEasing": "linear",
  "showMethod": "fadeIn",
  "hideMethod": "fadeOut"
}

function handleFormSubmitResponse(response) {
  if(response.result == 'ok') {
    document.location = response.redirectTo;
  } else {
    handleResponseErrors(response.errors);
  }//end else    
}

$(function() {
  //category-select
  $(document).ready(function(){
    $("input#search-category").val("");   
  });
 
  
  //category- search
  $(document.body).delegate("#search-category", "keyup", function(){
    var url = "/tour_categories";
    var keyWord = $(this).val();
    var delayTimer;
    clearTimeout(delayTimer);
    delayTimer = setTimeout(function() {
      $.ajax({
        url: url,
        type: "GET",
        data:{
          ajax_call: true,
          keyword: keyWord
        },
        success: function(data){
          $('div#categories_listing').html(data);
        },
        error: function(){
        }
      });
    },700);
  });
  
  // right-navigation for screen 320-768
  $(document).delegate('.navbar-minimalize.minimalize-styl-2', 'click', function(event) {
    event.preventDefault();
    
    if ($(".navbar-default").hasClass("toggle-class-show-hide")) {
      $(".navbar-default").animate({'left': 0});
    }
    else {
      $(".navbar-default").animate({'left': -225});     
    }
    $(".navbar-default").toggleClass("toggle-class-show-hide")
    
    return false;
  });
  
  $(document).delegate('*[data-toggle="lightbox"]', 'click', function(event) {
      event.preventDefault();
      $(this).ekkoLightbox();
  });
    
  $(document).delegate("a.choose-another-photo-button", 'click', function(e) {
    e.preventDefault();
    var dropZoneId = $(this).data('drop-zone-id');
    $('#' + dropZoneId).show();
    var myDropzone = Dropzone.forElement("div#" + dropZoneId);
    myDropzone.removeAllFiles();
    $(myDropzone.previewsContainer).html('');
  });
  
  $(document).on('submit', 'form.ajax-form', function(e) {
    var _this = this;   
    var noRedirectURLCustomer = $(e.currentTarget).hasClass("convert-customer-to-lead");   
    e.preventDefault(this);
    var formDom = $(this);
    var formData = new FormData(this);
    $(this).find("div.dropzone").each(function() {
      var dropzoneId = $(this).attr('id');
      var dropzone = Dropzone.forElement("div#" + dropzoneId);
      var queuedFiles = dropzone.getQueuedFiles();
      if(queuedFiles.length > 0) {
        formData.append(dropzone.options.paramName, queuedFiles[0]);
      }//end if
    });
    
    var handleResponseErrors = function(errors, form) {
      // form.prepend("<div class='form-errors-container'><ul class='form-errors'></ul></div>");
      var errorsDisplay = form.find('ul.form-errors');
      var numberOfErrors = 0;
      for(var key in errors) {
        // var fieldName = "home_page[" + key + "]";
        var fieldDom = $("*[name*='[" + key + "]']");
        var formGroup = fieldDom.parents('.form-group:first');
        formGroup.addClass("has-error");
        fieldDom.parent().append("<ul class='inline-errors'></ul>");
        var errorContainer = fieldDom.parent().find('ul.inline-errors');
    
        var fieldErrors = errors[key];
        for(var idx = 0; idx < fieldErrors.length; idx++) {
          if(formGroup.length > 0) {
            errorContainer.append("<li>" + fieldErrors[idx] + "</li>");
            // errorsDisplay.append("<li>" + formGroup.find('label:first').html().replace(/:/g, '') + " " + fieldErrors[idx] + "</li>");
          } else {
            errorsDisplay.append("<li>" + key + " " + fieldErrors[idx] + "</li>");
          }//end else
          numberOfErrors++;
        }//end for
      }//end for
      errorsDisplay.parent().prepend("<div>Please correct the following error(s) below:</div>");
      // $('html, body').animate({
      //   scrollTop: errorsDisplay.parent().offset().top
      // }, 200);
      $('div.has-error:first').find('input, select, textarea').focus();
    }
    var submitBtn = formDom.find('button[type=submit]:first');
    $.ajax({
      beforeSend: function() {
        submitBtn.html("Saving...").attr("disabled", "disabled");
        formDom.find("div.form-errors-container").remove();
        formDom.find("ul.inline-errors").remove();
        formDom.find("div.has-error").removeClass("has-error");
      },
      url: $(this).attr("action"),
      data: formData,
      processData: false,
      contentType: false,
      type: $(this).attr('method') || $(this).find('input[name=_method]:first').val(),
      success: function(response) {
        
        if(response.result == 'ok') {
          console.log("1111")
          if(response.flash) {
            console.log(response.flash.type)
            console.log(response.flash.message)
            $.cookie('flashType', response.flash.type, { path: '/' });
            $.cookie('flashMessage', response.flash.message, { path: '/' });
          }//end if
          if (response.customer_id) {
            document.getElementById("conver-customer-to-lead-url").href="/sales/leads/new?customer_id=" + response.customer_id ; 
          }
          if (response.modal_box){
            $('#ajax_modal').modal({
              show: true,
              backdrop: 'static',
              keyboard: true
            });
          }
          
        if (!noRedirectURLCustomer) {  
          if(typeof(Turbolinks) !== 'undefined') {
            Turbolinks.visit(response.redirect_to);
          } else {
            document.location = response.redirect_to;
          }
         } 
        } else {
          handleResponseErrors(response.errors, formDom);
        }//end else
        submitBtn.html("Save").removeAttr("disabled");        
      }
    });
  });
  
  if($.cookie('flashType')) {
    toastr['success']($.cookie('flashMessage'));
    $.removeCookie('flashType', { path: '/' });
    $.removeCookie('flashMessage', { path: '/' });
  }
  
  $('.summernote').summernote();
});

function remove_fields(link) {
  $(link).prev("input[type=hidden]").val("1");
  $(link).parents(".fields:first").fadeOut();
}

function add_fields(link, association, content) {
  var new_id = new Date().getTime();
  var regexp = new RegExp("new_" + association, "g");
  var contentDom = $(content.replace(regexp, new_id))
  $(link).parent().before(contentDom);
  contentDom.hide().fadeIn();
}

$(document).on('page:change', function() {
  if($.cookie('flashType')) {
    toastr['success']($.cookie('flashMessage'));
    $.removeCookie('flashType', { path: '/' });
    $.removeCookie('flashMessage', { path: '/' });
  }
  
  $('.summernote').summernote();
});

$(document).ready(function() {
  if ($('.updated-notifi').length == 1) {
    setTimeout(function() {
      $('.updated-notifi').fadeOut();
    }, 3000)
  }
  
});
