var AmazingBoneoApp = AmazingBoneoApp || {};

(function() {
	'use strict';
  AmazingBoneoApp.AdminController = AmazingBoneoApp.BaseController.extend({
		usersPage: function() {
			var _this = this;
			this._showHomeConatinerPageView('admin', function() {
				var usersPageView = new AmazingBoneoApp.UsersPageView();
				_this.homeContainerPageView.rightSidebarRegion.show(usersPageView);
			});
		}
  });
}());