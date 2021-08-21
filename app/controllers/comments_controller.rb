class CommentsController < ApplicationController

	def new
		@comment = Comment.new(cell_id: params[:cell_id])
	end

	def show
	end

	def create
		comment = Comment.new(comment_params)

		if comment.save!
			redirect_to cell_path(comment.cell)
		else
			# TODO: add error message
			redirect_to cell_path(params[:comment][:cell_id])
		end
	end

	def edit
	end

	def update
		comment = Comment.find(params[:id])
		comment.update(comment_params)

		redirect_to cell_path(comment.cell)
	end

	def delete
	end

	private

	def comment_params
		params.require(:comment).permit(:content, :user_id, :cell_id)
	end
end