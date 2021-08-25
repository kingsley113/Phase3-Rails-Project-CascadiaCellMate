class SessionsController < ApplicationController

	def new
	end

	def create
		# binding.pry

		# Create session based on regular user login
		if params[:username]
			user = User.find_by(username: params[:user][:username])
			user = user.try(:authenticate, params[:user][:password])
			# binding.pry
			return redirect_to login_path unless user

			session[:user_id] = user.id

			@user = user
			redirect_to user_path(@user)
		end

		# Create session based on Discord Login
		@user = User.find_or_create_by(uid: auth['uid']) do |u|
			u.username = auth['info']['name']
			u.image = auth['info']['image']
		end
		binding.pry
		session[:user_id] = @user.id

		redirect_to user_path(@user)
	end

	def gateway
		if params[:gateway]['code'] == "cascadiaiscool"
			session[:gateway_authenticated] = true
		else
			flash.alert = "Incorrect Access Code"
		end

		redirect_to signup_path

	end

	def destroy
		session.delete :user_id
		flash[:notice] = "Goodbye!"
		redirect_to login_path
	end



	def auth
		request.env['omniauth.auth']
	end

end