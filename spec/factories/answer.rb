require 'faker'

FactoryGirl.define do
  
  factory :answer do |f|
    f.name { Faker::Internet.email}
    f.answer { Faker::Lorem.paragraph}
  end

  factory :invalid_answer, :parent => :answer do |f|
    f.answer nil
  end

end