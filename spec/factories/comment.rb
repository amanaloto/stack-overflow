require 'faker'

FactoryGirl.define do
  
  factory :comment do |f|
    f.name { Faker::Internet.email}
    f.comment { Faker::Lorem.paragraph}
  end

  factory :invalid_comment, :parent => :comment do |f|
    f.comment nil
  end

end