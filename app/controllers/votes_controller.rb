class VotesController < ApplicationController
  def up
  	@question = Question.find(params[:question_id])
  	if params[:type] == "question"
      @vote = VoteQuestion.where(:user_id => session[:user_id], :question_id => params[:question_id]).first
      if @vote.nil?
        @vote = VoteQuestion.new(:user_id => session[:user_id], :question_id => params[:question_id], :points => 0)
      end
      @vote.update_attribute(:points, 1)
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
      @vote = VoteQuestion.where(:user_id => session[:user_id], :question_id => params[:question_id]).first
      if @vote.nil?
        @vote = VoteQuestion.new(:user_id => session[:user_id], :question_id => params[:question_id], :points => 0)
      end
      @vote.update_attribute(:points, -1)
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
