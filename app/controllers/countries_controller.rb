class CountriesController < AdminsController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  def index
    @countries = Country.where(on_the_top: true)
    @countries = smart_listing_create(:countries, @countries, partial: "countries/list", default_sort: {created_at: "desc"})
  end
  
  
  def edit
    @country = Country.find_by_id(params[:id])
  end

  def update
    @country = Country.find(params[:id])
      
    if @country.update_attributes(country_params)
      render json: {result: 'ok', redirect_to: countries_url, 
        flash: { type: :notice, message: 'Country details has been saved successfully!' }}
    else
      render json: { result: 'failed', errors: @country.errors }
    end
  end
  
  
  
  def country_params
    params.require(:country).permit(:name)
  end
  
end
