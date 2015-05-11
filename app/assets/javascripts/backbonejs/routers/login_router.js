var AmazingBoneoApp = AmazingBoneoApp || {};

(function() {
	'use strict';
	
	AmazingBoneoApp.LoginRouter = AmazingBoneoApp.AppRouter.extend({
	  el: "#container_wrapper",
    appRoutes: {
			"": "indexPage",
      "login": "loginPage",
			"start": 'startPage'
    },
    controller: new AmazingBoneoApp.LoginController()
  });
}());