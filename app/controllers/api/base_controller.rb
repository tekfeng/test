class Api::BaseController < ActionController::Base
  # before_filter :validate_api_key, :require_login_user

  def current_user
    @user
  end

  private

  def require_login_user
    if params[:auth_token].blank? == false
      @user = Member.find_by_authentication_token(params[:auth_token])
    elsif request.headers['auth-token'].blank? == false
      @user = Member.find_by_authentication_token(request.headers['auth-token'])
    end
    if @user.nil? || @user.active == false
      redirect_to :status => 401
    end
  end

  def validate_api_key
    if params[:api_key].blank? == false
      if params[:api_key] == APP_CONFIG[:api_key]
        return true
      else
        return redirect_to :status => 401
      end
    elsif request.headers['api-key'].blank? == false
      if request.headers['api-key'] == APP_CONFIG[:api_key]
        return true
      else
        return redirect_to :status => 401
      end
    else
      return redirect_to :status => 401
    end
  end
end
