class VotesController < ApplicationController
  def up
    @id, @type = params[:id], params[:type]
    Vote.up_vote @id, @type, current_user
    @total = total_points @id, @type
  end

  def down
    @id, @type = params[:id], params[:type]
    Vote.down_vote @id, @type, current_user
    @total = total_points @id, @type
  end
end
