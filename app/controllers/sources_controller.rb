class SourcesController < AdminsController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  def index
    @sources = Source.all
    if params[:ajax_call]
      @sources = Source.search(params)
      @sources = smart_listing_create(:sources, @sources, partial: "sources/list", default_sort: {created_at: "desc"}) 
      render template: "/sources/filter", layout: false
    else
      @sources = smart_listing_create(:sources, @sources, partial: "sources/list", default_sort: {created_at: "desc"})
    end       
  end
  
  def new
    @source = Source.new
  end
  
  def create
    @source = Source.new(source_params)
    if @source.save
      render json: { result: 'ok', redirect_to: sources_url, 
        flash: { type: :notice, message: 'Source has been created successfully!' }}
    else
      render json: { result: 'failed', errors: @source.errors }
    end
  end
  
  def edit
    @source = Source.find_by_id(params[:id])
  end

  def update
    @source = Source.find(params[:id])
    if @source.update_attributes(source_params)
      render json: {result: 'ok', redirect_to: sources_url, 
        flash: { type: :notice, message: 'Source details has been saved successfully!' }}
    else
      render json: { result: 'failed', errors: @source.errors }
    end
  end
  
  
  def toogle_active
    source = Source.find_by_id(params[:id])
    if source.active.nil?
      source.active = true
    else
      source.active = !source.active
    end
    source.save(validate: false)
    render json: {success: true}
  end
  
  
  
  def source_params
    params.require(:source).permit(:name)
  end
  
end
