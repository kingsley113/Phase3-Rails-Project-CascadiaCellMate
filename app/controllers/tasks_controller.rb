class TasksController < ApplicationController

	def index
		#maybe?
	end

	def new
		@task = Task.new(cell_id: params[:cell_id])
	end

	def show
	end

	def create
		@task = Task.new(task_params)

		if @task.save!
			redirect_to cell_path(@task.cell)
		else
			# TODO: Add alert message for invalid entry
			render 'new'
		end

	end

	def edit
	end

	def update 
	end

	def destroy
	end

	private

	def task_params
		params.require(:task).permit(:name, :description, :cell_id, :complete)
	end
end