class VotesController < ApplicationController
  def up
    Vote.up_vote params[:id], params[:type], current_user
    @total = total_points params[:id], params[:type]
  end

  def down
    Vote.down_vote params[:id], params[:type], current_user
    @total = total_points params[:id], params[:type]
  end
end
