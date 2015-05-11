var AmazingBoneoApp = AmazingBoneoApp || {};

(function() {
	'use strict';
  AmazingBoneoApp.ReservationsController = AmazingBoneoApp.BaseController.extend({
		reservationsPage: function() {
			var _this = this;
			this._showHomeConatinerPageView('reservations', function() {
      });
		}
  });
}());