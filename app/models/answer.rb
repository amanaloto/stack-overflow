class Answer < ActiveRecord::Base
  attr_accessible :answer, :name, :points, :question, :user_id

  belongs_to :question
  belongs_to :answer

  has_many :comments
end
