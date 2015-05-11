var AmazingBoneoApp = AmazingBoneoApp || {};

(function() {
	'use strict';
  AmazingBoneoApp.LoginController = AmazingBoneoApp.BaseController.extend({
		indexPage: function() {
			Backbone.history.navigate('login', true);
		},
		
		loginPage: function() {
			removeCookie('authentication_token');
			
			var loginPageView = new AmazingBoneoApp.LoginPageView();
			window.amazingBoneoApplication.content.show(loginPageView);
		},
		
		startPage: function() {
      this._checkLogin(function() {
  			var startPageConatainerPageView = new AmazingBoneoApp.StartPageContainerPageView();
  			window.amazingBoneoApplication.content.show(startPageConatainerPageView);
      });
		}
  });
}());