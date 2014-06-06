require 'faker'

FactoryGirl.define do
  
  factory :question do |f|
    f.name { Faker::Internet.email }
    f.title { Faker::Lorem.sentence }
    f.question { Faker::Lorem.paragraph }
  end

  factory :invalid_question, :parent => :question do |f|
    f.title nil
    f.question nil
  end

  factory :new_question, :parent => :question do |f|
    f.title 'New_title'
    f.question 'New_question'
  end

  factory :unique_question, :parent => :question do |f|
    f.title 'Unique_title'
    f.question 'Unique_question'
    f.name 'Unique_name'
  end
end