class CommentsController < ApplicationController
  def index
    @answer = Answer.find(params[:answer_id])
    @comments = @answer.comments.limit(5).offset(params[:offset])
    @offset = params[:offset].to_i + 5
    @count = @answer.comments.limit(5).offset(@offset).count
  end

  def new
    @answer = Answer.find(params[:answer_id])
    @comment = @answer.comments.new
  end

  def create
    @answer = Answer.find(params[:answer_id])
    @comment = @answer.comments.new(params[:comment])
    @comment.save
  end

  def destroy
    @answer = Answer.find(params[:answer_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    @count = @answer.comments.limit(5).offset(5).count
  end
end
