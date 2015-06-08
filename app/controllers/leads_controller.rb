class LeadsController <  BaseController
  def index
    @leads = Lead.all
    if params[:ajax_call]
      @leads = Lead.search(params)[:leads]
      render :partial => 'leads/list', locals: {leads: @leads}
    end
  end
  
  def new
    @lead = Lead.new
    @lead.tours.build
  end
  
end
