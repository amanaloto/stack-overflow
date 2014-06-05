class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password

  has_many :questions, :dependent => :destroy
  has_many :answers, :dependent => :destroy
  has_many :comments, :dependent => :destroy
  has_many :votes, :dependent => :destroy

  validates :email, :uniqueness => true
  validates_presence_of :email, :on => :create
  validates_presence_of :password, :on => :create

  def up_vote id, type
    @vote = create_vote id, type
    @vote.update_attribute(:points, 1)
  end

  def down_vote id, type
    @vote = create_vote id, type
    @vote.update_attribute(:points, -1)
  end

  private
  def create_vote id, type
    @vote = self.votes.where(:votable_id => id, :votable_type => type).first_or_initialize
    @vote.save if @vote.new_record?
    @vote
  end
end