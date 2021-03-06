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
			render 'new'
		end
	end

	def edit
		set_region
	end

	def update 
		set_region
		@region.update(region_params)

		if @region.save
			redirect_to region_path(@region)
		else
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
		@region = Region.find_by_slug(params[:id])
	end

	def region_params
		params.require(:region).permit(:name)
	end

end