class User < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation
  has_secure_password
  validates_presence_of :password, :on => :create

  has_many :questions
  has_many :answers
  has_many :comments
end