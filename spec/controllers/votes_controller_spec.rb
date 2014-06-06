require 'spec_helper'

describe VotesController, :type => :controller do
  let(:user) { FactoryGirl.create :user }
  let(:id) { FactoryGirl.generate(:random_id) }
  let(:type) { FactoryGirl.generate(:random_type) }

  before(:each){ session[:user_id] = user.id }

  describe '#up' do
    it 'assigns a valid id' do
      get :up, :id => id, :type => type
      expect(assigns(:id)).to eq(id)
    end

    it 'assigns a valid type' do
      get :up, :id => id, :type => type
      expect(assigns(:type)).to eq(type)
    end

    it 'assigns the total points to @total' do
      get :up, :id => id, :type => type
      expect(assigns(:total)).to eq(Vote.where(:votable_id => id, :votable_type => type).sum(:points))
    end

  end

  describe '#down' do
    it 'assigns a valid id' do
      get :down, :id => id, :type => type
      expect(assigns(:id)).to eq(id)
    end

    it 'assigns a valid type' do
      get :down, :id => id, :type => type
      expect(assigns(:type)).to eq(type)
    end

    it 'assigns the total points to @total' do
      get :down, :id => id, :type => type
      expect(assigns(:total)).to eq(Vote.where(:votable_id => id, :votable_type => type).sum(:points))
    end
  end
end