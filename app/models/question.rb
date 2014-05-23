class Question < ActiveRecord::Base
  attr_accessible :name, :points, :question, :title, :user_id

  belongs_to :user

  has_many :answers, :dependent => :destroy

  validates_presence_of :title, :on => :create
  validates_presence_of :question, :on => :create
end
