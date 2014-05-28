class Vote < ActiveRecord::Base
  attr_accessible :points, :user_id

  belongs_to :user
  belongs_to :votable, :polymorphic => true

  validates :points, :numericality => {:less_than_or_equal_to => 1}
  validates :points, :numericality => {:greater_than_or_equal_to => -1}
  
  def self.up_vote(id, type, user)
    @vote = create_vote id, type, user
    @vote.update_attribute(:points, 1)
  end

  def self.down_vote(id, type, user)
    @vote = create_vote id, type, user
    @vote.update_attribute(:points, -1)
  end

  def self.create_vote(id, type, user)
    @votable = type.constantize.find(id)
    @vote = @votable.votes.where(:user_id => user.id).first_or_initialize
    @vote.save if @vote.new_record?

    @vote
  end

  private_class_method :create_vote
end
