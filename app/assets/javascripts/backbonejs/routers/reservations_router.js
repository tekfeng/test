var AmazingBoneoApp = AmazingBoneoApp || {};

(function() {
	'use strict';
	
	AmazingBoneoApp.ReservationsRouter = AmazingBoneoApp.AppRouter.extend({
	  el: "#container_wrapper",
    appRoutes: {
      "reservations": "reservationsPage"
    },
    controller: new AmazingBoneoApp.ReservationsController()
  });
}());