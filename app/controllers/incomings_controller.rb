class IncomingsController < SalesController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  def index
    @incomings = Incoming.all 
    @incomings = Incoming.ransack(params[:search]).result if params[:search] 
    @incomings = smart_listing_create(:incomings, @incomings, partial: "incomings/list") 
  end
  
  def show
    @incoming = Incoming.find_by_id(params[:id])
    @users =  User.where(department_id: 1)
  end
  
  def submit_comment
    @incoming = Incoming.find_by_id(params[:id])
    if @incoming
      @comment = @incoming.incoming_comments.build(content: params[:content], user: current_user)
      if @comment.save
        render  partial: "incomings/comment_box", locals: {comment: @comment}
      else
        render json: {result: 'failed', reason: 'Comment content is required'}, status: 422
      end    
    else
      render json: {result: 'failed', reason: 'incoming could not be found'}, status: 422
    end    
  end
  
  def create_lead_base_on_ic
    action = ""
    incoming = Incoming.find_by_id(params[:ic_id].to_i)
    user = User.find_by_id(params[:id])
    
    # check customer exist?
    customer = Customer.find_by_email_address(incoming.try(:email_address))
    if customer.nil?
      customer = Customer.new({ 
        name: incoming.try(:customer_name),
        email_address: incoming.try(:email_address)
      })
      customer.save(validate: false)
    end
    
    # create a lead base on incoming (check lead exist then create or edit)
    lead = Lead.find_by_incoming_id(incoming.try(:id))
    if lead.nil?
      action = "create"
      lead = user.leads.new({
        customer_id: customer.try(:id),
        incoming_id: incoming.try(:id)
      })
     
    else
      action = "edit"
      lead.user = user
    end
        
    lead.save(validate: false)
    user.notifications.create(message: "One Lead was #{action} and bin to you")
    render json: { status: "ok", action: action }
  end     
  
end
