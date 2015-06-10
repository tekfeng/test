class LeadsController <  BaseController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  
  def index
    if params[:ajax_call]
      @leads = Lead.search(params)
      @leads = smart_listing_create(:leads, @leads, partial: "leads/list") 
      render template: "/leads/filter", layout: false     
    else
      @leads = Lead.all
      @leads = smart_listing_create(:leads, @leads, partial: "leads/list") 
    end
  end
  
  def new
    @lead = Lead.new
    if params[:customer_id]
      @lead.customer_id = params[:customer_id].to_i
      @convert_cus_tomer_to_lead =  true
    end   
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
      render template: "leads/new"
    end
  end
  
  
  def edit
    @lead = Lead.find_by_id(params[:id])
  end

  def update
    @lead = Lead.find(params[:id])
    if @lead.update_attributes(lead_params)
      if params[:lead] and params[:lead][:lead_tour_category_tours_attributes]
        params[:lead][:lead_tour_category_tours_attributes].each do |key, value|
          if value[:id]
            ltour = LeadTourCategoryTour.find_by_id(value[:id].to_i)
            ltour.tour_id = value[:tour_id].to_i
            ltour.tour_category_id = value[:tour_category_id].to_i
            ltour.save(validate: false)
          else
            @lead.lead_tour_category_tours.create({
              tour_id: value[:tour_id].to_i,
              tour_category_id: value[:tour_category_id]
            })
          end             
        end
      end      
      redirect_to leads_url
    else
      render template: "leads/edit"
    end
  end
  
  
  private

  def lead_params
    params.require(:lead).permit(:customer_id, :travel_from, :travel_to, :status, :sales_person, :adults, :children, :contact_number, :tour_id)
  end
  
end
