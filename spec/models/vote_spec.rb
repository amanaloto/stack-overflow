require 'spec_helper'

describe Vote do
  it 'is invalid with points > 1' do
    expect(FactoryGirl.build(:vote, :points => 2)).to_not be_valid
  end
  
  it 'is invalid with points < -1' do
    expect(FactoryGirl.build(:vote, :points => -1)).to be_valid
  end
end