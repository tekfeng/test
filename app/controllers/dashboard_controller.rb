class DashboardController < BaseController
  
  def index    
    render template: "dashboard/index", layout: "index_page"
  end
  
end
