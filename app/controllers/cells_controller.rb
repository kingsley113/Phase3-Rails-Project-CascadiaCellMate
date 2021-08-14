class CellsController < ApplicationController

	def index
		# binding.pry
		if params[:user_id]
			@user = User.find(params[:user_id])
			@cells = @user.cells
		elsif params[:query]
			@cells = Cell.search(params[:query])
		else
			@cells = Cell.all
			@regions = Region.all
		end
	end

	def new
		@cell = Cell.new
	end

	def show
		set_cell
	end

	def create
		@cell = Cell.new(cell_params)
		# binding.pry
		if @cell.save!
			redirect_to cell_path(@cell)
		else
			# TODO: alert: "Please fill out all required fields."
			render 'new'
		end
	end

	def edit
		set_cell
	end

	def update 
		set_cell
		# binding.pry
		@cell.update(cell_params)
		if @cell.save!
			redirect_to cell_path(@cell)
		else
			# TODO: Add alert message here
			render 'edit'
		end
	end

	def destroy
	end


	private

	def cell_params
		params.require(:cell).permit(:name, :description, :ck_coordinate_x, :ck_coordinate_y, :user_id, :region_id, :percent_complete, :color, :query)
	end

	def set_cell
		@cell = Cell.find(params[:id])
	end

	
end