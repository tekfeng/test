class LeadsController <  BaseController
  def index
    @leads = Lead.all
  end
  
  def new
    @lead = Lead.new
    @lead.user = current_user
  end
  
  def create
  end
end
