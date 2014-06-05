require 'faker'

FactoryGirl.define do
  factory :user do |f|
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password }
  end

  factory :question do |f|
    f.name { Faker::Internet.email }
    f.title { Faker::Lorem.sentence }
    f.question { Faker::Lorem.paragraph }
  end

  factory :answer do |f|
    f.name { Faker::Internet.email}
    f.answer { Faker::Lorem.paragraph}
  end

  factory :comment do |f|
    f.name { Faker::Internet.email}
    f.comment { Faker::Lorem.paragraph}
  end

  factory :vote do |f|
    f.votable_id { Faker::Number.digit }
    f.votable_type 'Question'
    f.points 0
  end

end
