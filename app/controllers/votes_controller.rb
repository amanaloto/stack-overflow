class VotesController < ApplicationController
  def up
  	@question = Question.find(params[:question_id])
    @vote = Vote.where(:user_id => session[:user_id], :votable_id => params[:id], :votable_type => params[:type]).first
    if @vote.nil?
      @vote = Vote.create
      @vote.user = current_user
      @vote.save
    end

  	if params[:type] == "Question"
      if @vote.votable.nil?
        @vote.votable  = @question
        @vote.save
      end
      @vote.update_attribute(:points, 1)

  	elsif params[:type] == "Answer"
  		@answer = Answer.find(params[:id])
      if @vote.votable.nil?
        @vote.votable = @answer
        @vote.save
      end
      @vote.update_attribute(:points, 1)

  	elsif params[:type] == "Comment"
  		@comment = Comment.find(params[:id])
  		if @vote.votable.nil?
        @vote.votable = @comment
        @vote.save
      end
      @vote.update_attribute(:points, 1)
  	end

  	redirect_to question_path(@question)
  end

  def down
  	@question = Question.find(params[:question_id])
    @vote = Vote.where(:user_id => session[:user_id], :votable_id => params[:id], :votable_type => params[:type]).first
    if @vote.nil?
      @vote = Vote.create
      @vote.user = current_user
      @vote.save
    end

  	if params[:type] == "Question"   
      if @vote.votable.nil?
        @vote.votable = @question
        @vote.save
      end
      @vote.update_attribute(:points, -1)

  	elsif params[:type] == "Answer"
      @answer = Answer.find(params[:id])
      if @vote.votable.nil?
        @vote.votable = @answer
        @vote.save
      end
      @vote.update_attribute(:points, -1)

  	elsif params[:type] == "Comment"
  		@comment = Comment.find(params[:id])
      if @vote.votable.nil?
        @vote.votable = @comment
        @vote.save
      end
  		@vote.update_attribute(:points, -1)

  	end

  	redirect_to question_path(@question)
  end
end
