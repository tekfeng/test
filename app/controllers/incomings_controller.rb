class IncomingsController < SalesController
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  def index
    @incomings = Incoming.all
    
    @incomings = Incoming.ransack(params[:search]).result if params[:search] 
    
    if params[:search_rs].present? and params[:search_rs][:search_all].present?
      @incomings = Incoming.ransack(params[:search_rs]).result 
    end
    
    
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
  
  def get_username
    user = User.find_by_id(params[:id])
    render json: {name: user.username }
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
    
    incoming.user = user
    incoming.save   
    
    lead.save(validate: false)
    notifi = user.notifications.create(message: "You have been allocated to a new lead [#{incoming.try(:email_address)}].")
    notifi.notifitable = lead
    notifi.save
    render json: { status: "ok", action: action }
  end     
  
end
