class ToursController < AdminsController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  def index 
    @tour_categories = TourCategory.all
    if params[:ajax_call]
      @tours = Tour.search(params)[:tours]
      @tours = smart_listing_create(:tours, @tours, partial: "tours/list", default_sort: {created_at: "desc"}) 
      render template: "/tours/filter", layout: false
    else
      @tours = Tour.all
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
      render json: { result: 'ok', redirect_to: tours_url, 
        flash: { type: :notice, message: 'Tour has been created successfully!' }}
    else
      render json: { result: 'failed', errors: @tour.errors }
    end
  end
  
  def edit
    @tour = Tour.find_by_id(params[:id])
    @tours = TourCategory.all
  end

  def update
    @tour = Tour.find(params[:id])
    if @tour.update_attributes(tour_params)
      render json: {result: 'ok', redirect_to: tours_url, 
        flash: { type: :notice, message: 'Tour details has been saved successfully!' }}
    else
      render json: { result: 'failed', errors: @tour.errors }
    end
  end
  
  private

  def tour_params
    params.require(:tour).permit(:name, :code, :tour_category_id)
  end
end
