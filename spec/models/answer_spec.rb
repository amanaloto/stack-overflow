require 'spec_helper'

describe Answer do
  it 'is invalid without an answer' do
    expect(FactoryGirl.build(:answer, :answer => nil)).to_not be_valid
  end
end