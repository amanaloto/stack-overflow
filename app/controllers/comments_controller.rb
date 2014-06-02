class CommentsController < ApplicationController
  def new
    @question = Question.find(params[:question_id])
    @answer = @question.answers.find(params[:answer_id])
    @comment = @answer.comments.new
  end

  def create
    @answer = Answer.find(params[:answer_id])
    @comment = @answer.comments.new(params[:comment])
    @comment.comment = parse_tags @comment.comment
    @comment.save
  end

  def destroy
    @answer = Answer.find(params[:answer_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
  end
end
