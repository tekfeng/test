class UsersController < AdminsController
  
  include SmartListing::Helper::ControllerExtensions
  helper  SmartListing::Helper
  
  def index
    if params[:ajax_call]
      @users = User.search(params)
      @users = smart_listing_create(:users, @users, partial: "users/list", default_sort: {username: "asc"}) 
      render template: "/users/filter", layout: false
    else
      @users = User.all
      @users = smart_listing_create(:users, @users, partial: "users/list", default_sort: {username: "asc"}) 
    end                        
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(users_params)
    random_password = Rails.env == "development" ? "password" : (0...8).map { (65 + rand(26)).chr }.join
    @user.password = random_password   
    if @user.save
      ApplicationMailer.welcome_user(@user, random_password).deliver
      redirect_to "/users"
    else
      render :action => "new"
    end
  end
  
  
  def edit
    @user = User.find_by_id(params[:id])
  end

  def update
    @user = User.find_by_id(params[:id])
    if @user.update_attributes(users_params)        
      redirect_to users_url    
    else
      render :action => "edit"
    end
  end
  

  private
  
  
  def users_params
    params.require(:user).permit(:username, :email, :contact_number, :department_id)
  end
end