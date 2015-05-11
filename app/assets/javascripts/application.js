// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs

//= require ./backbonejs/templates
//= require ./backbonejs/libraries/underscore-1.5.2
//= require ./backbonejs/libraries/backbone-1.1.0
//= require ./backbonejs/libraries/backbone.marionette-1.4.0

//= require_tree ./backbonejs/models
//= require_tree ./backbonejs/collections
//= require_tree ./backbonejs/views

//= require ./backbonejs/routers/app_router
//= require_tree ./backbonejs/routers

function startAmazingBoneoApplication() {
  window.amazingBoneoApplication = new Backbone.Marionette.Application();

  window.amazingBoneoApplication.addRegions({
    header: "#header",
    content: "#content",
    footer: "#footer"
  });

  window.amazingBoneoApplication.addInitializer(function(options) {
    window.adminRouter = new AmazingBoneoApp.AdminRouter();
    // new AmazingBoneoApp.SalesRouter();
    Backbone.history.start({pushState: false});
  });

  window.amazingBoneoApplication.start();
}

$(document).ready(function() {
  startAmazingBoneoApplication();
});