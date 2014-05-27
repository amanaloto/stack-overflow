class AnswersController < ApplicationController
	def new
		@question = Question.find(params[:question_id])
		@answer = @question.answers.build
	end

	def create
		@question = Question.find(params[:question_id])
		@answer = @question.answers.create(params[:answer])
		
		redirect_to question_path(@question)
	end

	def destroy
		@question = Question.find(params[:question_id])
		@answer = @question.answers.find(params[:id])
		@answer.destroy

		respond_to do |format|
			format.html { redirect_to question_path(@question)}
			format.js { render :nothing => true}
		end
	end
end
