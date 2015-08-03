class VehiclesController < OperationsController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  def index
    @vehicles = Vehicle.all
    @vehicles = Vehicle.ransack(params[:search]).result if params[:search] 
    if params[:search_rs].present? 
      @vehicles = Vehicle.ransack(params[:search_rs]).result 
    end
    @vehicles = smart_listing_create(:vehicles , @vehicles, partial: "vehicles/list") 
  end
  
  def show
    @vehicle = Vehicle.find_by_id(params[:id])
    
  end
  
  def new
    @vehicle = Vehicle.new
  end
  
  def create
    @vehicle = Vehicle.new(vehicle_params)
    if @vehicle.save
      flash[:form_notice] = {type: 'success', message: "#{@vehicle.vehicle_no} has been added to the lists."}
      redirect_to vehicles_url 
    else
      render action: 'new'
    end    
    
  end
  
  def edit
  end
  
  def update
  end          
    
  private
  def vehicle_params
    params.require(:vehicle).permit(:vehicle_no, :vehicle_type_id, :remark, :licence_validity, :last_mantenance, :center)
  end
  
  
end
