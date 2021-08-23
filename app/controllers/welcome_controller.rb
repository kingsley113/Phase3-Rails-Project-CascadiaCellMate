class WelcomeController < ApplicationController

	def home
		@recent_cells = current_user.get_recent_cells	
		# @recent_cells = Cell.where(id: current_user.recent_cells)
	end

end