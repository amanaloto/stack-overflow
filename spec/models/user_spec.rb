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

    #This clears the DB for any existing record
    vote = Vote.where(:votable_id => question.id, :votable_type => 'Question', :user_id => user.id).first
    vote.destroy if vote

    user.up_vote question.id, 'Question'
    expect(user.votes.where(:votable_id => question.id, :votable_type => 'Question').first.points).to eq 1
  end
  it 'creates a down vote' do
    user = FactoryGirl.create(:user)
    question = FactoryGirl.create(:question, :name => user.email, :user_id => user.id)

    #This clears the DB for any existing record
    vote = Vote.where(:votable_id => question.id, :votable_type => 'Question', :user_id => user.id).first
    vote.destroy if vote

    user.down_vote question.id, 'Question'
    expect(user.votes.where(:votable_id => question.id, :votable_type => 'Question').first.points).to eq -1
  end
end