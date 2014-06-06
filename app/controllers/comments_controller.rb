class CommentsController < ApplicationController
  def index
    @answer = Answer.find(params[:answer_id])
    @comments = @answer.comments.page(params[:page]).per(5)
    @next_page = params[:page].to_i + 1
    @count = @answer.comments.page(@next_page).per(5).count

    render :nothing => true
  end

  def new
    @answer = Answer.find(params[:answer_id])
    @comment = @answer.comments.new

    render :nothing => true
  end

  def create
    @answer = Answer.find(params[:answer_id])
    @comment = @answer.comments.new(params[:comment])
    @comment.save

    render :nothing => true
  end

  def destroy
    @answer = Answer.find(params[:answer_id])
    @comment = Comment.find(params[:id])
    @comment.destroy
    @count = @answer.comments.limit(5).offset(5).count
    
    render :nothing => true
  end
end
