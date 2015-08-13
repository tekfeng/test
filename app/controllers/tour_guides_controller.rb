class TourGuidesController < OperationsController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  def index
    @tour_guides = TourGuide.all
    @tour_guides = TourGuide.ransack(params[:search]).result if params[:search] 
    
    if params[:search_rs].present? and params[:search_rs][:search_all].present?
      @tour_guides = TourGuide.ransack(params[:search_rs]).result 
    end
    @tour_guides = smart_listing_create(:tour_guides , @tour_guides, partial: "tour_guides/list") 
  end
  
  def show
    @tour_guide = TourGuide.find_by_id(params[:id])
  end
  
  def new
    @tour_guide = TourGuide.new
  end
  
  def create
    @tour_guide = TourGuide.new(tour_guide_params)
    if @tour_guide.save
      flash[:form_notice] = {type: 'success', message: "#{@tour_guide.name} has been added to the lists."}
      redirect_to tour_guides_url 
    else
      render action: 'new'
    end    
    
  end
  
  def edit
    @tour_guide = TourGuide.find_by_id(params[:id])
    
  end
  
  def update
    @tour_guide = TourGuide.find_by_id(params[:id])
    if @tour_guide  
      if @tour_guide.update_attributes(tour_guide_params)
        flash[:form_notice] = {type: 'success', message: "#{@tour_guide.name} information updated."}
        redirect_to tour_guide_url(@tour_guide) 
      else
        render action: 'edit'
      end    
    else
      flash[:form_notice] = {type: 'fail', message: "Cannot update information. Please check again."}
      redirect_to tour_guides_url
    end    
  end
  
  private 
  def tour_guide_params
    params.require(:tour_guide).permit(:name, :period, :tour_type, :total_tours, :allowance, :total_allowances, :remark)
  end              
  
end
