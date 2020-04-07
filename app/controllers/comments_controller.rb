class CommentsController < ApplicationController

	def create
		@book = Book.find(params[:book_id])
		@comment = @book.comments.build(comment_params)
		@comment.user_id = current_user.id
		@comment.save
		render :index
	end

	def destroy
		@comment = Comment.find(params[:book_id])
		@book = @comment.book
		@comment.destroy
		render :index
	end

	private
	def comment_params
		params.require(:comment).permit(:comment)
	end
end
