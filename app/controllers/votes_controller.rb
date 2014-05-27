class VotesController < ApplicationController
  def up
    Vote.up_vote params[:id], params[:type], current_user

    @question = Question.find(params[:question_id])

    respond_to do |format|
      format.js
    end
  end

  def down
    Vote.down_vote params[:id], params[:type], current_user

    @question = Question.find(params[:question_id])

  	respond_to do |format|
      format.js
    end
  end
end
