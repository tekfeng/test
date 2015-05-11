var AmazingBoneoApp = AmazingBoneoApp || {};

AmazingBoneoApp.UsersPageView = Backbone.Marionette.Layout.extend({
  // emptyView: ICR360App.LoadingMessageView,
  template: jade.templates["users_page_view_tmpl"],
  tagName: "div",
  id: "login_page_container",
  events: {},
  ui: {},
  regions: {},
  
  onRender: function () {},
  onShow: function() {}
});