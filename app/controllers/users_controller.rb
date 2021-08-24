class UsersController < ApplicationController

	def index
		# maybe? probably dont need to ever show a list of all users except admin?
	end

	def new
		@user = User.new
	end

	def show
		set_user
	end

	def create
		@user = User.create(params[:id])

		if @user.save
			session[:user_id] = @user.id
			redirect_to user_path(@user)
		else
			render 'new'
		end
	end

	def edit
		set_user
	end

	def update 
		set_user

		@user.update(user_params)

		if @user.save
			redirect_to user_path(@user)
		else
			# TODO: add flash error message
			render 'edit'
		end
	end

	def destroy
		# admin only
	end

	private

	def user_params
		params.require(:user).permit(:username, :password, :display_name, :discord_id, :accent_color)
	end

	def set_user
		@user = User.find_by_slug(params[:id])
	end
end