class ToursController < BaseController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  def index 
    @tour_categories = TourCategory.all
    if params[:ajax_call]
      @tours = Tour.search(params)[:tours]
      @tours = smart_listing_create(:tours, @tours, partial: "tours/list", default_sort: {name: "asc"}) 
      render template: "/tours/filter", layout: false
    else
      @tours = Tour.all
      @tours = smart_listing_create(:tours, @tours, partial: "tours/list", default_sort: {name: "asc"}) 
    end                        
  end
  
  def dashboard_page
    render template: "dashboard/dashboard_page", layout: "dashboard"
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
  
  def tour_of_tour_category
    tour_category = TourCategory.find_by_id(params[:id].to_i)
    p tour_category
    tours = tour_category.tours
    render json: tours.as_json('selectbox')
  end
  private

  def tour_params
    params.require(:tour).permit(:name, :code, :tour_category_id)
  end
end
