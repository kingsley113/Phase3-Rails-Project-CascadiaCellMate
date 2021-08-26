class TasksController < ApplicationController

	def new
		@task = Task.new(cell_id: params[:cell_id])
	end

	def show
	end

	def create
		@task = Task.create(task_params)
		
		redirect_to cell_path(@task.cell)
	end

	def edit
	end

	def update 
		@task = Task.find(params[:id])
		@task.update(task_params)

		redirect_to cell_path(@task.cell)
	end

	def destroy
	end

	private

	def task_params
		params.require(:task).permit(:name, :description, :cell_id, :complete)
	end
end