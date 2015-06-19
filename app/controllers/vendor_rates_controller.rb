class VendorRatesController < ReservationsController  
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  def index
    if params[:ajax_call]
      @vendors = smart_listing_create(:vendor_rates, @vendors, partial: 'vendor_rates/list', default_sort: {name: "asc"})
      render template: "/vendor_rates/filter", layout: false   
    else
      @vendors = Vendor.all
      @vendors = smart_listing_create(:vendor_rates, @vendors, partial: 'vendor_rates/list', default_sort: {name: "asc"})
    end
  end
  
  def view_rate
    @vendor = Vendor.find_by_id(params[:id])
  end

  def update_vendor_rates_old
    @vendor = Vendor.find_by_id(params[:id])
    params[:vendor][:vendor_rates_attributes].each do |key, value|
      if value[:id].present? # update value for vendor rate
        vendor_rate = VendorRate.find_by_id(value[:id].to_i)
        if vendor_rate
          vendor_rate.effective = value[:effective]
          vendor_rate.expired = value[:expired]
          vendor_rate.remarks = value[:remarks]
          if value[:competitors_attributes] # update competitor list name
            value[:competitors_attributes].each do |key_in, value_in|
              if value_in[:id]
                competitor = Competitor.find_by_id(value_in[:id].to_i)
                competitor.name = value_in[:name]
                competitor.save
              else
                vendor_rate.competitors.create({name: value_in[:name]})
              end       
            end
          end         
        end
        vendor_rate.save
      else
        vendor_rate_new = @vendor.vendor_rates.create({
          rate_type: 4,
          effective: value[:effective],
          expired: value[:expired],
          remarks: value[:remarks]
        })
      end      
    end    
    render template: "vendor_rates/view_rate", locals: {updated:  true }   
  end
  
  def update_vendor_rates
    @vendor = Vendor.find_by_id(params[:id])
    if @vendor.update_attributes(vendor_params)
      render template: "vendor_rates/view_rate", locals: {updated:  true }   
    else
      p @vendor.errors.full_messages
      render template: "vendor_rates/view_rate"
    end
  end
  
  def edit_rate
    @vendor = Vendor.find_by_id(params[:vendor_id].to_i)
    @vendor_rate = VendorRate.find_by_id(params[:id].to_i)
    @competitor_id = @vendor_rate.competitors.first.try(:id)
  end
  
  def update_current_contact
    @competitor_id = params[:competitor_id].to_i     
    @vendor = Vendor.find_by_id(params[:vendor_id].to_i)
    @vendor_rate = VendorRate.find_by_id(params[:id].to_i)   
    @vendor_rate.contract_file = params[:vendor_rate][:contract_file] if params[:vendor_rate] and params[:vendor_rate][:contract_file]   
    if params[:room_price]
      params[:room_price].each do |key, value|
        room_id = key.split("_")[0].to_i
        season_id = key.split("_")[1].to_i
        rate_type = key.split("_")[2].to_i
        vendor_rate_id = key.split("_")[3].to_i
        
        competitor_id = key.split("_")[4].to_i == 0 ? nil : key.split("_")[4].to_i   
        
        price = SeasonRoomPrice.find_or_create_by(season_id: season_id, room_id: room_id, rate_type: rate_type, competitor_id: competitor_id, vendor_rate_id: vendor_rate_id)
        price.price = value
        price.save 
      end
    end
   
    if @vendor_rate.save
      render template: "vendor_rates/edit_rate", locals: { updated:  true, competitor_id: @competitor_id}   
    else
      p @vendor_rate.errors.full_messages
      render template: "vendor_rates/edit_rate"
    end
  end
  
  def download_files
    @vendor_rate = VendorRate.find_by_id(params[:id].to_i)  
     send_file @vendor_rate.contract_file.path, filename: @vendor_rate.contract_file_file_name
  end
  
  def filter_table_by_competitor
    @vendor = Vendor.find_by_id(params[:vendor_id].to_i)
    @vendor_rate = VendorRate.find_by_id(params[:vendor_rate_id].to_i)
    @competitor_id = params[:competitor_id].to_i
    render partial: "/vendor_rates/filter_table_by_competitor"   
  end
  
  private

  def vendor_params
    params.require(:vendor).permit(:name, :email, :fax, :contact, :city_id, :vendor_type, :vendor_category_id, vendor_rates_attributes: [:id, :effective, :expired, :remarks, :_destroy, competitors_attributes: [:id, :name, :_destroy]])
  end
    
end
