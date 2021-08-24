class WelcomeController < ApplicationController

	def home
		@cells = Cell.all
		@recent_cells = current_user.get_recent_cells	
		# @recent_cells = Cell.where(id: current_user.recent_cells)

		# add methods to get data for pie chart
		# @data = 
	end

end