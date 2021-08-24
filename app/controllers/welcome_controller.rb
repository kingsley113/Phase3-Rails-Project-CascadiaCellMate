class WelcomeController < ApplicationController

	def home
		redirect_if_not_logged_in

		@cells = Cell.all
		if logged_in? && @recent_cells
			# binding.pry
			@recent_cells = current_user.get_recent_cells	
		end
		# @recent_cells = Cell.where(id: current_user.recent_cells)

		# add methods to get data for pie chart
		# @data = 
	end



end