require 'faker'

FactoryGirl.define do
  sequence :random_page do |n|
    @random_page ||= (1..10).to_a.shuffle
    @random_page[n]
  end

  sequence :random_id do
    Faker::Number.digit
  end

  sequence :random_type do
    ['Question', 'Answer', 'Comment'].shuffle[0]
  end

  factory :user do |f|
    f.email { Faker::Internet.email }
    f.password { Faker::Internet.password }
  end

  factory :invalid_user, :parent => :user do |f|
    f.email nil
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

  factory :invalid_answer, :parent => :answer do |f|
    f.answer nil
  end

  factory :comment do |f|
    f.name { Faker::Internet.email}
    f.comment { Faker::Lorem.paragraph}
  end

  factory :invalid_comment, :parent => :comment do |f|
    f.comment nil
  end

  factory :vote do |f|
    f.votable_id { Faker::Number.digit }
    f.votable_type 'Question'
    f.points 0
  end

end
