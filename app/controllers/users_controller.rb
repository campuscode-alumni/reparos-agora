class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @user.update_average
  end
end