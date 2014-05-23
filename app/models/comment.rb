class Comment < ActiveRecord::Base
  attr_accessible :answer, :comment, :name, :points, :user_id

  belongs_to :answer
  belongs_to :user

  validates_presence_of :comment, :on => :create
end
