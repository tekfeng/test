var AmazingBoneoApp = AmazingBoneoApp || {};

AmazingBoneoApp.HomeContainerPageView = Backbone.Marionette.Layout.extend({
  // emptyView: ICR360App.LoadingMessageView,
  template: jade.templates["home_container_page_view_tmpl"],
  tagName: "div",
  id: "home_page_container",
  events: {},
  ui: {
		homeHeaderContainerUI: '#home_header_container',
		leftSidebarUI: "#left_sidebar_container"
	},
  regions: {
		leftSidebarRegion: "#left_sidebar_container",
		rightSidebarRegion: "#right_sidebar_container"
	},
  
  onRender: function () {},
  onShow: function() {
		this.ui.leftSidebarUI.css('height', $(window).height() - this.ui.homeHeaderContainerUI.height());
	}
});