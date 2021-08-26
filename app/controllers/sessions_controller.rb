class SessionsController < ApplicationController

	def new
	end

	def create
		# Create session based on regular user login
		if params[:user]
			@user = User.find_by(username: params[:user][:username])
			@user = @user.try(:authenticate, params[:user][:password])

			return redirect_to login_path unless @user

			session[:user_id] = @user.id

		# Create session based on Discord Login
		else
			@user = User.find_or_create_by(uid: auth['uid']) do |u|
				u.username = auth['uid']
				u.display_name = auth['info']['name']
				u.image = auth['info']['image']
				u.random_password
			end

			session[:user_id] = @user.id
		end

		redirect_to user_path(@user)
	end

	def gateway
		# Code for live version: "doeshesmelllikegluten"
		if params[:gateway]['code'] == "cascadiaiscool"
			session[:gateway_authenticated] = true
		else
			flash.alert = "Incorrect Access Code"
		end

		redirect_to login_path
	end

	def destroy
		session.delete :user_id
		flash[:notice] = "Goodbye!"
		redirect_to login_path
	end

	private

	def auth
		request.env['omniauth.auth']
	end
end