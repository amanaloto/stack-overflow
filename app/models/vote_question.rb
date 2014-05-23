class VoteQuestion < ActiveRecord::Base
  belongs_to :user
  belongs_to :question
  attr_accessible :points, :user_id, :question_id

  validates :points, :numericality => {:less_than_or_equal_to => 1}
  validates :points, :numericality => {:greater_than_or_equal_to => -1}
end
