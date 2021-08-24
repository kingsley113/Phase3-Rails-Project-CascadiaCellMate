class SessionsController < ApplicationController

	def new
	end

	def create
		user = User.find_by(username: params[:user][:username])
		user = user.try(:authenticate, params[:user][:password])
		# binding.pry
		return redirect_to login_path unless user

		session[:user_id] = user.id

		@user = user
		redirect_to user_path(@user)
	end

	def destroy
		session.delete :user_id
		flash[:notice] = "Goodbye!"
		redirect_to login_path
	end

end