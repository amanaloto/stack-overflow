class VotesController < ApplicationController
  def up
    create_vote(params[:id], params[:type])
    @vote.update_attribute(:points, 1)

    @question = Question.find(params[:question_id])
  	redirect_to question_path(@question)
  end

  def down
    create_vote(params[:id], params[:type])
    @vote.update_attribute(:points, -1)

    @question = Question.find(params[:question_id])
  	redirect_to question_path(@question)
  end

  def create_vote(id, type)
    @votable = type == "Question" ? Question.find(id) : type == "Answer" ? Answer.find(id) : Comment.find(id)

    @vote = Vote.where(:user_id => session[:user_id], :votable_id => id, :votable_type => type).first
    if @vote.nil?
      @vote = Vote.create
      @vote.user = current_user
      @vote.votable = @votable
      @vote.save
    end
  end
end
