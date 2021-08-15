class UsersController < ApplicationController

	def index
		# maybe? probably dont need to ever show a list of all users except admin?
	end

	def new
		@user = User.new
	end

	def show
		@user = User.find_by_slug(params[:id])
	end

	def create
		@user = User.create(params[:id])

		if @user.save!
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end

	def edit
	end

	def update 
	end

	def destroy
		# admin only
	end

	private

	def user_params
		params.require(:user).permit(:username, :password, :display_name, :discord_id, :accent_color)
	end

end