var AmazingBoneoApp = AmazingBoneoApp || {};

(function() {
	'use strict';
	
	AmazingBoneoApp.AdminRouter = AmazingBoneoApp.AppRouter.extend({
	  el: "#container_wrapper",
    appRoutes: {
      "users": "usersPage"
    },
    controller: new AmazingBoneoApp.AdminController()
  });
}());