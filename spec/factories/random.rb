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

  sequence :random_search do
    Faker::Lorem.sentence(2, false, 0)
  end
end
