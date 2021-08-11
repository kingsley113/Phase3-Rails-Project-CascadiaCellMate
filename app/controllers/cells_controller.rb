class CellsController < ApplicationController

	def index
		@cells = Cell.all
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