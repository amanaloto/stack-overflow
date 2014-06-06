class Comment < ActiveRecord::Base
  attr_accessible :answer, :comment, :name, :points, :user_id

  belongs_to :answer
  belongs_to :user

  has_many :votes, :as => :votable, :dependent => :destroy
  
  validates_presence_of :comment

  paginates_per 5
end
