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

	def no_user
		@cells = Cell.no_user
	end

	def index
		if params[:user_id]
			@user = User.find_by(slug: params[:user_id])
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

		if params[:user_id]
			@cell.user = User.find_by(slug: params[:user_id])
		end

		if params[:region_id]
			@cell.region = Region.find_by(slug: params[:region_id])
		end

	end

	def show
		set_cell
		current_user.set_recent_cell(@cell)
	end

	def create
		@cell = Cell.new(cell_params)
		if @cell.save
			@cell.create_default_tasks
			redirect_to cell_path(@cell)
		else
			render 'new'
		end
	end

	def edit
		set_cell
	end

	def update 
		set_cell
		@cell.update(cell_params)
		if @cell.save
			redirect_to cell_path(@cell)
		else
			render 'edit'
		end
	end

	def destroy
		set_cell
		@cell.delete

		redirect_to cells_path
	end

	private

	def cell_params
		params.require(:cell).permit(:name, :description, :ck_coordinate_x, :ck_coordinate_y, :user_id, :region_id, :percent_complete, :color, :query, :slug, :priority)
	end

	def set_cell
		if params[:id].to_i == 0
			@cell = Cell.find_by_slug([params[:id]])
		else
			@cell = Cell.find(params[:id])
		end
	end

	def all_cells
		@cells = Cell.all
	end
end