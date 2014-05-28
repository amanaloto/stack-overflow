class CommentsController < ApplicationController
	def new
		@question = Question.find(params[:question_id])
		@answer = @question.answers.find(params[:answer_id])
		@comment = @answer.comments.new

		respond_to do |format|
			format.js
		end
	end

	def create		
		# @question = Question.find(params[:question_id])
		@answer = Answer.find(params[:answer_id])
		@question = Question.find(@answer.question_id)
		@comment = @answer.comments.create(params[:comment])

		respond_to do |format|
			format.js
		end
	end

	def destroy
		@answer = Answer.find(params[:answer_id])
		@question = Question.find(@answer.question_id)
		@comment = Comment.find(params[:id]) #not sure if this is safe
		@comment.destroy

		respond_to do |format|
			format.js
		end
	end
end
