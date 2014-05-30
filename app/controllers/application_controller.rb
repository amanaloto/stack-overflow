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

  def parse_tags(string)
    ActionView::Base.full_sanitizer.sanitize(string).split(" ").each do |word|
      if word[0] == "@"
        user = User.where(:email => word[1,word.length].chomp).first
        id = user.id if user
        tag = "<a href='/users/" + id.to_s + "'>"
        string[string.index(word), word.length] = tag + word.chomp + "</a>"
      end
    end

    string
  end
end
