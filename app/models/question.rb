class Question < ActiveRecord::Base
  attr_accessible :name, :points, :question, :title, :user_id

  belongs_to :user

  has_many :answers
end
