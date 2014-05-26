class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  helper_method :current_user, :total_points

  def current_user
  	@current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def total_points(id, type)
    Vote.where(:votable_id => id, :votable_type => type).sum(:points)
  end
end
