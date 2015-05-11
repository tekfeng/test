var AmazingBoneoApp = AmazingBoneoApp || {};

(function() {
	'use strict';
  AmazingBoneoApp.AdminController = Marionette.Controller.extend({
		indexPage: function() {
			Backbone.history.navigate('users', true);
		},
		
		usersPage: function() {
			var usersPageView = new AmazingBoneoApp.UsersPageView();
			
			window.amazingBoneoApplication.content.show(usersPageView);
		}
  });

	AmazingBoneoApp.AdminRouter = AmazingBoneoApp.AppRouter.extend({
	  el: "#container_wrapper",
    appRoutes: {
			"": "indexPage",
      "users": "usersPage"
    },
    controller: new AmazingBoneoApp.AdminController()
  });
}());