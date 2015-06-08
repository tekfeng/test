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
  end
  
  def create
    @lead = Lead.new(lead_params)
    @lead.user_id = current_user.id    
    if @lead.save      
      if params[:lead] and params[:lead][:lead_tour_category_tours_attributes]
        params[:lead][:lead_tour_category_tours_attributes].each do |key, value|
          @lead.lead_tour_category_tours.create({
            tour_id: value[:tour_id].to_i,
            tour_category_id: value[:tour_category_id]
          })
        end
      end
      
      redirect_to leads_url
    else
      render json: { result: 'failed', errors: @lead.errors }
    end
  end
  
  
  def edit
    @lead = Lead.find_by_id(params[:id])
  end

  def update
    @lead = Lead.find(params[:id])
    if @lead.update_attributes(tour_params)
      render json: {result: 'ok', redirect_to: tours_url, 
        flash: { type: :notice, message: 'Tour details has been saved successfully!' }}
    else
      render json: { result: 'failed', errors: @tour.errors }
    end
  end
  
  
  
  private

  def lead_params
    params.require(:lead).permit(:customer_id, :travel_from, :travel_to, :status, :sales_person, :adults, :children)
  end
  
end
