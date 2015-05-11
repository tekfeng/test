var AmazingBoneoApp = AmazingBoneoApp || {};

(function() {
	'use strict';
	
	AmazingBoneoApp.SalesRouter = AmazingBoneoApp.AppRouter.extend({
	  el: "#container_wrapper",
    appRoutes: {
      "sales": "salesPage"
    },
    controller: new AmazingBoneoApp.SalesController()
  });
}());