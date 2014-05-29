class AnswersController < ApplicationController
	def new
		@question = Question.find(params[:question_id])
		@answer = @question.answers.build
	end

	def create
		@question = Question.find(params[:question_id])
		@answer = @question.answers.create(params[:answer])
	end

	def destroy
		@question = Question.find(params[:question_id])
		@answer = @question.answers.find(params[:id])
		@answer.destroy
	end
end
