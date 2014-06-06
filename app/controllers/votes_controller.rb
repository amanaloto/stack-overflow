class VotesController < ApplicationController
  def up
    @id, @type = params[:id], params[:type]
    current_user.up_vote @id, @type
    @total = total_points @id, @type

    render :nothing => true
  end

  def down
    @id, @type = params[:id], params[:type]
    current_user.down_vote @id, @type
    @total = total_points @id, @type

    render :nothing => true
  end
end
