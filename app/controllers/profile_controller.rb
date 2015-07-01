class ProfileController < BaseController
  
  def edit_profile
    @user = current_user
  end
  
  def update_profile
    @user = current_user
    if @user.update_attributes(users_params) 
      flash[:update_profile] = true
      @image_src = @user.avatar.exists? ? @user.avatar.url(:avatar) : "/assets/dashboard/persona.png"
      render :action => "edit_profile"
    else
      render :action => "edit_profile"
    end
  end
  
  def change_password
    @user = current_user
  end
  
  def update_password
    @user = current_user
    if request.post?
      if current_user.update_password(params.require(:user).permit!)
        sign_in current_user, :bypass => true
        flash[:update_password] = true
        
        render :action => "change_password"
      else
        render :action => "change_password"
      end
    end
  end
  
  private 
   
  def users_params
    params.require(:user).permit(:email, :contact_number, :avatar)
  end
  
  
end
