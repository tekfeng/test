class UsersController < ApplicationController
  def get_all
    render :json => User.all
  end
end