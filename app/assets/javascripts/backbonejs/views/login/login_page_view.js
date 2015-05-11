var AmazingBoneoApp = AmazingBoneoApp || {};

AmazingBoneoApp.LoginPageView = Backbone.Marionette.Layout.extend({
  // emptyView: ICR360App.LoadingMessageView,
  template: jade.templates["login_page_view_tmpl"],
  tagName: "div",
  id: "users_page_container",
  events: {
  	"submit form": 'submitForm'
  },
  ui: {},
  regions: {},
  
  onRender: function () {},
  onShow: function() {},
	
	submitForm: function(event) {
		event.preventDefault();
		
		Backbone.history.navigate('start', true);
	}
});