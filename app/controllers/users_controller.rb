class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:notice] = "Signed-up successfully!"
      redirect_to new_session_path
    else
      render "new"
    end
  end

  def show
    @user = User.find(params[:id])
  end
end
