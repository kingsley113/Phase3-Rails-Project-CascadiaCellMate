class ApplicationController < ActionController::Base
	helper_method :current_user

	def current_user
		# binding.pry
		User.find_by(id: session[:user_id])
	end
end
