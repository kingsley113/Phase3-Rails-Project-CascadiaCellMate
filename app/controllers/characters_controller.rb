class CharactersController < ApplicationController

	def index
		@characters = Cell.find(params[:cell_id]).characters
	end
	


end