class LeadsController <  SalesController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  
  def index
    if params[:ajax_call]
      @leads = Lead.search(params)
      @leads = smart_listing_create(:leads, @leads, partial: "leads/list", default_sort: {travel_from: "asc"}) 
      render template: "/leads/filter", layout: false     
    else
      @leads = Lead.all
      @leads = smart_listing_create(:leads, @leads, partial: "leads/list", default_sort: {travel_from: "asc"}) 
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
      @leads = Lead.all
      @leads = smart_listing_create(:leads, @leads, partial: "leads/list", default_sort: {travel_from: "asc"}) 
      render template: "leads/index", locals: { show_flash: true}
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
      @leads = Lead.all
      @leads = smart_listing_create(:leads, @leads, partial: "leads/list", default_sort: {travel_from: "asc"}) 
      render template: "leads/index", locals: { show_flash: true}
    else
      render :action => "edit"
    end
  end
  
  
  def send_pdf_quotation 
    @lead = Lead.find_by_id(params[:id])
    ApplicationMailer.delay.send_quotation_pdf(@lead.customer, @lead)
    redirect_to leads_url
  end 
  
  private

  def lead_params
    params.require(:lead).permit(:customer_id, :travel_from, :travel_to, :status, :sales_person, :adults, :children, :contact_number,
    lead_tour_category_tours_attributes:[:id, :tour_id, :tour_category_id ,:_destroy])
  end
  
end
