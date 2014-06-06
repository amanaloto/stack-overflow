require 'faker'

FactoryGirl.define do
  
  factory :vote do |f|
    f.votable_id { Faker::Number.digit }
    f.votable_type 'Question'
    f.points 0
  end

end