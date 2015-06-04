class VendorsController < BaseController
  
  def index   
    @vendors = Vendor.all
    if params[:vendor_categopry_id]
      @vendors = @vendors.where(vendor_category_id: params[:vendor_categopry_id].to_i)
    end    
  end
  
  def filter_vendor
    @vendors = Vendor.all   
    if params[:category_id].present?
      @vendors = @vendors.where(vendor_category_id: params[:category_id].to_i)
    end    
    if params[:city_id].present?
      @vendors = @vendors.where(city_id: params[:city_id].to_i)
    end      
    render partial: "/#{params[:render_to_view]}/vendor_table"   
  end
  
  def new
    @vendor = Vendor.new
  end
  
  def create
    @vendor = Vendor.new(vendor_params)
    @vendor.user_create_id = current_user.id
    if @vendor.save
      render json: { result: 'ok', redirect_to: vendors_url, 
        flash: { type: :notice, message: 'Vendor has been created successfully!' }}
    else
      render json: { result: 'failed', errors: @vendor.errors }
    end
  end
  
  def edit
    @vendor = Vendor.find_by_id(params[:id])
  end

  def update
    @vendor = Vendor.find(params[:id])
    @vendor.user_update_id = current_user.id
    if @vendor.update_attributes(vendor_params)
      redirect_to :action=>'index'
    else
      render :edit
    end
  end
  
  def more_details
    @vendor = Vendor.find(params[:id])
  end
  
  def update_more_details
    @vendor = Vendor.find(params[:id])
    if params[:vendor][:rooms_attributes]
      params[:vendor][:rooms_attributes].each do |key, value|
        if value[:id].present? 
          room = Room.find_by_id(value[:id].to_i)
          if room
            room.name = value[:name]
          end
        
        else
          room = @vendor.rooms.new({
            name: value[:name]
          })
        end            
        room.save
      end
    end
     
    if @vendor.save
      redirect_to vendors_url
    else
      render json: { result: 'failed', errors: room.errors.full_messages }
    end
    
  end
  
  private

  def vendor_params
    params.require(:vendor).permit(:name, :email, :fax, :contact, :city_id, :vendor_type, :vendor_category_id)
  end
end
