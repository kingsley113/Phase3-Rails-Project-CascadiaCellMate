class CellsController < ApplicationController

	def map_cell_color
		all_cells
	end

	def map_progress_color
		all_cells
	end

	def map_user_color
		all_cells
	end



	def index
		# binding.pry
		if params[:user_id]
			@user = User.find_by(username: params[:user_id])
			@cells = @user.cells
		elsif params[:query]
			@cells = Cell.search(params[:query])
		else
			@cells = Cell.all
			@regions = Region.all
		end

		@cells = @cells.sort_by &:name
	end

	def new
		@cell = Cell.new
	end

	def show
		set_cell
		current_user.set_recent_cell(@cell)
	end

	def create
			@cell = Cell.new(cell_params)
			if @cell.save!
				@cell.create_default_tasks
				redirect_to cell_path(@cell)
			else
				# TODO: alert: "Please fill out all required fields."
				render 'new'
			end
	end

	def edit
		set_cell
		# binding.pry
		# @cell = Cell.find_by_slug([params[:id]])
	end

	def update 
		set_cell
		# binding.pry
		# if @cell.valid_coordinates?
			@cell.update(cell_params)
			if @cell.save!
				redirect_to cell_path(@cell)
			else
				# TODO: Add alert message here
				render 'edit'
			end
		# else
		# 	# TODO: Alert for duplicate cells
		# 	render'edit'
		# end
	end

	def destroy
	end


	private

	def cell_params
		params.require(:cell).permit(:name, :description, :ck_coordinate_x, :ck_coordinate_y, :user_id, :region_id, :percent_complete, :color, :query, :slug, :priority)
	end

	def set_cell
		# @cell = Cell.find_by(id: params[:id])
		@cell = Cell.find_by_slug([params[:id]])
	end

	def all_cells
		@cells = Cell.all
	end

	
end