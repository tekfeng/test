class LeadsController <  BaseController
  def index
    @leads = Lead.all
  end
  
  def new
    @lead = Lead.new
  end
  
  def create
  end
end
