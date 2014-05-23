class Answer < ActiveRecord::Base
  attr_accessible :answer, :name, :points, :question, :user_id

  belongs_to :question
  belongs_to :users

  validates_presence_of :answer, :on => :create

  has_many :comments, :dependent => :destroy
end