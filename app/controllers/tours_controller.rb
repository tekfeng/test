class ToursController < AdminsController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  def index 
    @tour_categories = TourCategory.all
    if params[:ajax_call]
      @tours = Tour.joins(:tour_category).search(params)[:tours]
      @tours = smart_listing_create(:tours, @tours, partial: "tours/list", default_sort: {created_at: "desc"}) 
      render template: "/tours/filter", layout: false
    else
      @tours = Tour.joins(:tour_category).all
      @tours = smart_listing_create(:tours, @tours, partial: "tours/list", default_sort: {created_at: "desc"})
    end                        
  end
  
  def dashboard_page
   
  end
  
  def new
    @tour = Tour.new
    @tours = TourCategory.all
  end
  
  def create
    @tour = Tour.new(tour_params)
    if @tour.save
      flash[:notice_tour] = true
      redirect_to "/tours"
    else
      render :action => "new"
    end
  end
  
  def edit
    @tour = Tour.find_by_id(params[:id])
    @tours = TourCategory.all
  end

  def update
    @tour = Tour.find(params[:id])
    if @tour.update_attributes(tour_params)
      flash[:notice_tour] = true     
      redirect_to "/tours"    
    else
      render :action => "edit"
    end
  end
  
  private

  def tour_params
    params.require(:tour).permit(:name, :code, :tour_category_id, :price_per_person, :description, :min_number_pax)
  end
end
