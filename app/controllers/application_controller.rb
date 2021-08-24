class ApplicationController < ActionController::Base
	helper_method :current_user 
	helper_method :logged_in?

	def current_user
		User.find_by(id: session[:user_id])
	end

	def logged_in?
		!!current_user
	end

	def redirect_if_not_logged_in
		# binding.pry
		unless logged_in?
			# binding.pry
			redirect_to login_path, alert: "You must be logged in to view this page"
		end
	end

	
end
