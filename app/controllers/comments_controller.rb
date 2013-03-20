class CommentsController < ApplicationController

	def create


		commentable_id = params[:commentable_id]
		commentable_type = params[:commentable_type]
		college_id = params[:college_id]
		user_id = params[:user_id]
		text = params[:text]

		@comment = Comment.new(commentable_id: commentable_id, commentable_type: commentable_type, college_id: college_id, user_id: user_id, text: text)


		if @comment.save
			redirect_to :back
		else
			redirect_to :back, notice: 'Comment not added, something went wrong'
		end

		#@comment = Comment.new(commentable_id: commentable_id, commentable_type: commentable_type, college_id: college_id, user_id: user_id, text: text)

		#@comment.save

		

	end


end
