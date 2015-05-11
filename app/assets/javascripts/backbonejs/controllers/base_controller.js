var AmazingBoneoApp = AmazingBoneoApp || {};

(function() {
	'use strict';
  AmazingBoneoApp.BaseController = Marionette.Controller.extend({
		_checkLogin: function(callback) {
			if(getCookie('authentication_token')) {
				if(typeof(callback) == 'function') { callback.call(); }
			}
			else {
				Backbone.history.navigate('login', true);
			}
		},
		
		_showHomeConatinerPageView: function(type, callback) {
			var _this = this;
			this._checkLogin(function() {
				_this.homeContainerPageView = new AmazingBoneoApp.HomeContainerPageView();
				window.amazingBoneoApplication.content.show(_this.homeContainerPageView);
			
				var collection = new AmazingBoneoApp.CommonCollection(_this._generateLeftSidebar(type));
				var homeLeftSidebarListItemView = new AmazingBoneoApp.HomeLeftSidebarListItemView({collection: collection});
				_this.homeContainerPageView.leftSidebarRegion.show(homeLeftSidebarListItemView);
			
				if(typeof(callback) == 'function') { callback.call(); }
			});
		},
		
		_generateLeftSidebar: function(type) {
			var data = {
				'admin': [
					{
						'title': 'Users',
						'url': 'users'
					},
					{
						'title': 'Tours (Input cost price)',
						'url': 'tours'
					},
					{
						'title': 'Tour Categories',
						'url': 'tour_categories'
					},
					{
						'title': 'Non-Tours',
						'url': 'non_tours'
					},
					{
						'title': 'Reports',
						'url': 'reports'
					}
				]
			};
			
			return data[type];
		}
  });
}());