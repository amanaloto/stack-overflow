class Question < ActiveRecord::Base
  include PgSearch

  attr_accessible :name, :points, :question, :title, :user_id

  belongs_to :user

  has_many :answers, :dependent => :destroy
  has_many :votes, :as => :votable, :dependent => :destroy

  validates_presence_of :title
  validates_presence_of :question

  pg_search_scope :search_full_text, :against => {
    :title => 'A',
    :question => 'B',
    :name => 'C'
  }
  
end
