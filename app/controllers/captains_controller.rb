class CaptainsController < OperationsController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  def index
    @captains = Captain.all
    @captains = Captain.ransack(params[:search]).result if params[:search] 
    
    if params[:search_rs].present? and params[:search_rs][:search_all].present?
      @captains = Captain.ransack(params[:search_rs]).result 
    end
    @captains = smart_listing_create(:captains , @captains, partial: "captains/list") 
  end
  
  def show
    @captain = Captain.find_by_id(params[:id])
  end  
  
  def new
    @captain = Captain.new
  end
  
  def create
    @captain = Captain.new(captain_params)
    if @captain.save
      flash[:form_notice] = {type: 'success', message: "#{@captain.name} has been added to the lists."}
      redirect_to captains_url 
    else
      render action: 'new'
    end    
  end
  
  def edit
    @captain = Captain.find_by_id(params[:id])
  end
  
  def update
    @captain = Captain.find_by_id(params[:id])
    if @captain  
      if @captain.update_attributes(captain_params)
        flash[:form_notice] = {type: 'success', message: "#{@captain.name} information updated."}
        redirect_to captain_url(@captain) 
      else
        render action: 'edit'
      end    
    else
      flash[:form_notice] = {type: 'fail', message: "Cannot update information. Please check again."}
      redirect_to captains_url
    end    
  end      
  
  
  private
  def captain_params
    params.require(:captain).permit(:name, :join_date, :availability, :contact, :allowance, :remark, :personal_particular, :address, :center, :email)
  end
      
end
