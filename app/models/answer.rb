class Answer < ActiveRecord::Base
  attr_accessible :answer, :name, :points, :question, :user_id

  belongs_to :question
  belongs_to :users

  has_many :comments, :dependent => :destroy
  has_many :votes, :as => :votable, :dependent => :destroy
  
  validates_presence_of :answer, :on => :create

  paginates_per 7
end