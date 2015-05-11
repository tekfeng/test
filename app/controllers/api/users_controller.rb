class Api::UsersController < ApiApplicationController
  def get_all
    render :json => User.all
  end
end