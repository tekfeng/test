var AmazingBoneoApp = AmazingBoneoApp || {};

AmazingBoneoApp.HomeLeftSidebarListItemView = Backbone.Marionette.CompositeView.extend({
  // emptyView: ICR360App.LoadingMessageView,
	template: jade.templates['home_left_sidebar_list_item_view_tmpl'],
  itemView: AmazingBoneoApp.HomeLeftSidebarItemView,
	itemViewContainer: 'ul',
	
  onRender: function() {}
});