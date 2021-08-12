class CellsController < ApplicationController

	def index
		if params[:user_id]
			@user = User.find(params[:user_id])
			@cells = @user.cells
		else
			@cells = Cell.all
		end
	end

	def new
	end

	def show
		@cell = Cell.find(params[:id])
	end

	def edit
	end

	def update 
	end

	def destroy
	end

end