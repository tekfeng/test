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
    @country.on_the_top = false
    @country.save(validate: false)
    @countryU = Country.find(params[:country][:id].to_i) 
    @countryU.on_the_top = true
    @countryU.save(validate: false)
    redirect_to countries_url
  end
  
  
  
  def country_params
    params.require(:country).permit(:name)
  end
  
end
