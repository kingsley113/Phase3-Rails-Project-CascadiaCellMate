class QuestsController < ApplicationController

	def index
	end

	def new
	end

	def show
		@quest = Quest.find_by_slug(params[:id])
	end

	def edit
	end

	def update 
	end

	def destroy
		# admin only?
	end

end