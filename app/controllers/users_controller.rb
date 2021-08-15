class UsersController < ApplicationController

	def index
		# maybe? probably dont need to ever show a list of all users except admin?
	end

	def new
		# signup
	end

	def show
		@user = User.find_by_slug(params[:id])
	end

	def edit
	end

	def update 
	end

	def destroy
		# admin only
	end

end