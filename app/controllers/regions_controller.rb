class RegionsController < ApplicationController

	def index
		@regions = Region.all
	end

	def new
		@region = Region.new
	end

	def show
		set_region
	end

	def create
		@region = Region.new(region_params)

		if @region.save
			redirect_to region_path(@region)
		else
			# TODO: alert text message
			render 'new'
		end
	end

	def edit
		# admin only
		set_region
	end

	def update 
		# admin only
		set_region
		@region.update(region_params)

		if @region.save
			redirect_to region_path(@region)
		else
			# TODO: alert text message
			render 'edit'
		end
	end

	def destroy
		# admin only
		set_region
		@region.delete
	end

	private 

	def set_region
		# @region = Region.find(params[:id])
		@region = Region.find_by_slug(params[:id])
	end

	def region_params
		params.require(:region).permit(:name)
	end

end