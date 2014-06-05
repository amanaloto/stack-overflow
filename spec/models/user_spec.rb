require 'spec_helper'

describe User do
  it 'has a valid factory' do
    expect(FactoryGirl.create(:user)).to be_valid
  end
  it 'is invalid without an email' do
    expect(FactoryGirl.build(:user, :email => nil)).to_not be_valid
  end
  it 'is invalid without a password' do
    expect(FactoryGirl.build(:user, :password => nil)).to_not be_valid
  end
  it 'does not allow duplicate email' do
    user = User.find_by_email('Test')
    user ||= FactoryGirl.create(:user, :email => 'Test')
    expect(FactoryGirl.build(:user, :email => 'Test')).to_not be_valid
  end
  it 'creates an up vote' do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question, :name => user.email, :user_id => user.id)
    expect(user.up_vote(question.id, 'Question')).to eq true
  end
  it 'creates an down vote' do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question, :name => user.email, :user_id => user.id)
    expect(user.down_vote(question.id, 'Question')).to eq true
  end
end