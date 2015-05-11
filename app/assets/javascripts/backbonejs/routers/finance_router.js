var AmazingBoneoApp = AmazingBoneoApp || {};

(function() {
	'use strict';
	
	AmazingBoneoApp.FinanceRouter = AmazingBoneoApp.AppRouter.extend({
	  el: "#container_wrapper",
    appRoutes: {
      "finances": "financesPage"
    },
    controller: new AmazingBoneoApp.FinanceController()
  });
}());