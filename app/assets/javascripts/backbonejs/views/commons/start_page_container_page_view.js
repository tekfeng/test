var AmazingBoneoApp = AmazingBoneoApp || {};

AmazingBoneoApp.StartPageContainerPageView = Backbone.Marionette.Layout.extend({
  // emptyView: ICR360App.LoadingMessageView,
  template: jade.templates["start_page_container_page_view_tmpl"],
  tagName: "div",
  id: "start_page_container",
  events: {
  	"click a": "goToHomePage"
  },
  ui: {},
  regions: {},
  
  onRender: function () {},
  onShow: function() {},
	
	goToHomePage: function(event) {
		event.preventDefault();
		
		Backbone.history.navigate('home', true);
	}
});