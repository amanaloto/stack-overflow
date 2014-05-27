class VotesController < ApplicationController
  def up
    Vote.up_vote params[:id], params[:type], current_user

    @question = Question.find(params[:question_id])
  	redirect_to question_path(@question)
  end

  def down
    Vote.down_vote params[:id], params[:type], current_user

    @question = Question.find(params[:question_id])
  	redirect_to question_path(@question)
  end
end
