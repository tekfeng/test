class MountainGuidesController < OperationsController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  def index
    @mountain_guides = MountainGuide.all
    @mountain_guides = MountainGuide.ransack(params[:search]).result if params[:search] 
    
    if params[:search_rs].present? and params[:search_rs][:search_all].present?
      @mountain_guides = MountainGuide.ransack(params[:search_rs]).result 
    end
    @mountain_guides = smart_listing_create(:mountain_guides , @mountain_guides, partial: "mountain_guides/list") 
    
  end
  
  def new
    @mountain_guide = MountainGuide.new
  end
  
  def show
    @mountain_guide = MountainGuide.find_by_id(params[:id])
  end  
  
  def create
    @mountain_guide = MountainGuide.new(guide_params)
    if @mountain_guide.save
      flash[:form_notice] = {type: 'success', message: "#{@mountain_guide.name} has been added to the lists."}
      redirect_to mountain_guides_url 
    else
      render action: 'new'
    end    
  end
  
  def edit
    @mountain_guide = MountainGuide.find_by_id(params[:id])
  end
  
  def update
    @mountain_guide = MountainGuide.find_by_id(params[:id])
    if @mountain_guide  
      if @mountain_guide.update_attributes(guide_params)
        flash[:form_notice] = {type: 'success', message: "#{@mountain_guide.name} information updated."}
        redirect_to mountain_guide_url(@mountain_guide) 
      else
        render action: 'edit'
      end    
    else
      flash[:form_notice] = {type: 'fail', message: "Cannot update information. Please check again."}
      redirect_to mountain_guides_url
    end    
  end
  
  private
  def guide_params
    params.require(:mountain_guide).permit(:name, :period, :total_climb, :penalty, :incentive)
  end
end
