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
  
end
