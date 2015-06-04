class MtqSlotsController < BaseController
  
  def index   
    @mtq_slots = MtqSlot.all
  end
  
  def new
    @mtq_slot = MtqSlot.new
  end
  
  def create
    @mtq_slot = MtqSlot.new(mtq_slot_params)
    if @mtq_slot.save
      render json: { result: 'ok', redirect_to: vendors_url, 
        flash: { type: :notice, message: 'MtqSlot has been created successfully!' }}
    else
      render json: { result: 'failed', errors: @mtq_slot.errors }
    end
  end
  
  def edit
    @mtq_slot = MtqSlot.find_by_id(params[:id])
  end
  
  def edit_mtq_slot
    @mtq_slot = MtqSlot.find_or_create_by(date: params[:date])
    render partial: "/mtq_slots/edit_mtq_slot"   
  end
  
  def updated_ajax
    @mtq_slot = MtqSlot.find_by_id(params[:id])
    @mtq_slot.available_slot = params[:available_slot]
    
    if @mtq_slot.save
      events_array = MtqSlot.mtq_slot_all_date.to_s.gsub('"', '').html_safe
      render json: { 
        events_array: events_array,
        available_slot_in_this_month: MtqSlot.available_slot_in_this_month,
        available_slot_in_next1_month: MtqSlot.available_slot_in_next1_month,
        available_slot_in_next2_month: MtqSlot.available_slot_in_next2_month
      }
    else
      render json: { result: 'failed', errors: @mtq_slot.errors }
    end 
  end

  def update
    @mtq_slot = MtqSlot.find_by_id(params[:id])
    if @mtq_slot.update_attributes(mtq_slot_params)
      render json: {result: 'ok', redirect_to: mtq_slots_url, 
        flash: { type: :notice, message: 'MtqSlot details has been saved successfully!' }}
    else
      render json: { result: 'failed', errors: @mtq_slot.errors }
    end
  end
  
  private

  def mtq_slot_params
    params.require(:mtq_slot).permit(:available_slot)
  end
end
