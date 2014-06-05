class Vote < ActiveRecord::Base
  attr_accessible :points, :user_id

  belongs_to :user
  belongs_to :votable, :polymorphic => true

  validates :points, :numericality => {:less_than_or_equal_to => 1}
  validates :points, :numericality => {:greater_than_or_equal_to => -1}
end
