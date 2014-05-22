class VotesController < ApplicationController
  def up
  	@question = Question.find(params[:question_id])
  	if params[:type] == "question"
  		@question.points += 1
  		@question.save
  	elsif params[:type] == "answer"
  		@answer = Answer.find(params[:id])
  		@answer.points += 1
  		@answer.save
  	elsif params[:type] == "comment"
  		@comment = Comment.find(params[:id])
  		@comment.points += 1
  		@comment.save
  	end

  	redirect_to question_path(@question)
  end

  def down
  	@question = Question.find(params[:question_id])
  	if params[:type] == "question"
  		@question.points -= 1
  		@question.save
  	elsif params[:type] == "answer"
  		@answer = Answer.find(params[:id])
  		@answer.points -= 1
  		@answer.save
  	elsif params[:type] == "comment"
  		@comment = Comment.find(params[:id])
  		@comment.points -= 1
  		@comment.save
  	end

  	redirect_to question_path(@question)
  end
end
