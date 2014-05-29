class CommentsController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:answer_id])
    @comment = @answer.comments.new
  end

  def create
    @answer = Answer.find(params[:answer_id])
    @comment = @answer.comments.create(params[:comment])
  end

  def destroy
    @answer = Answer.find(params[:answer_id])
    @comment = Comment.find(params[:id]) #not sure if this is safe
    @comment.destroy
  end
end
