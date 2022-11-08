class UsersController < ApplicationController
  def index
    @users.all
  end

  def show
    @user = Users.find(params[:id])
  end
end
