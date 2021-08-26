class WelcomeController < ApplicationController

	def home
		redirect_if_not_logged_in

		@cells = Cell.all
		if logged_in? && current_user.recent_cells
			@recent_cells = current_user.get_recent_cells	
		end
	end

end