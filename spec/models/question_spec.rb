require 'spec_helper'

describe Question do
  it 'is invalid without a title' do
    expect(FactoryGirl.build(:question, :title => nil)).to_not be_valid
  end
  it 'is invalid without a question' do
    expect(FactoryGirl.build(:question, :question => nil)).to_not be_valid
  end
end