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
		set_comment
	end

	def update
		set_comment
		@comment.update(comment_params)

		redirect_to cell_path(@comment.cell)
	end

	def destroy
		set_comment
		cell = @comment.cell
		@comment.delete

		redirect_to cell_path(cell)
	end

	private

	def set_comment
		@comment = Comment.find(params[:id])
	end

	def comment_params
		params.require(:comment).permit(:content, :user_id, :cell_id)
	end
end