require 'spec_helper'

describe Comment do
  it 'is invalid without a comment' do
    expect(FactoryGirl.build(:comment, :comment => nil)).to_not be_valid
  end
end