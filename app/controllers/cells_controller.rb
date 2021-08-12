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
		@cell = Cell.new
	end

	def show
		@cell = Cell.find(params[:id])
	end

	def create
		@cell = Cell.new(cell_params)
		# binding.pry
		if @cell.save!
			redirect_to cell_path(@cell)
		else
			# alert: "Please fill out all required fields."
			render 'new'
		end
	end

	def edit
	end

	def update 
	end

	def destroy
	end


	private

	def cell_params
		params.require(:cell).permit(:name, :description, :ck_coordinate_x, :ck_coordinate_y, :user_id, :region_id, :percent_complete, :color)
	end
end