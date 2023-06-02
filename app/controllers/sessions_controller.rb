class SessionsController < ApplicationController
	skip_before_action :verify_authenticity_token

	def new
	end

	def create
			user = User.find_by_username(params[:session][:username])
			if user && user.authenticate(params[:session][:password])
				session[:user_id] = user.id
				@notice = "User logged in successfully"
				flash[:notice] = "User logged in successfully"
				flash[:success] = true
				redirect_to user
			else
				flash.now[:notice] = "Login failed"
				flash.now[:success] = false
				render "new"
			end
	end

	def destroy
		session[:user_id] = nil
		flash[:notice] = "Logged out successfully"
		flash[:success] = true
		redirect_to root_path
	end
end