class SessionsController < ApplicationController
	def new
	end

	def create
		@user = User.find_by_email(params[:email])
		if @user && @user.authenticate(params[:password])
			session[:user_id] = @user.id
			flash[:notice] = "Logged in successfully!"
			redirect_to questions_path
		else
			flash.now.alert = "Invalid email or password!"
			render "new"
		end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "Logged out!"
		redirect_to root_url
	end
end
