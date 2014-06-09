require 'spec_helper'

describe ApplicationController, :type => :controller do
  let(:user) { FactoryGirl.create :user }

  describe '#current_user' do
    context 'with an existing session' do
      before(:each){ session[:user_id] = user.id }

      it 'returns the current logged-in user' do
        expect(subject.current_user).to eq user
      end
    end

    context 'without an existing session' do
      it 'returns nil' do
        expect(subject.current_user).to be_nil
      end
    end
  end

  describe '#total_points' do
    let(:votable) { Question.first }
    let(:points) { Vote.where(:votable_id => votable.id, :votable_type => 'Question').sum(:points)}

    it 'returns the total points given a votable' do
      expect(subject.total_points votable.id, 'Question').to eq points
    end
  end

  describe '#parse_tags' do

    context 'with a user in the database' do
      let(:string) { '<p>@' + user.email + '</p>'}

      it 'parses the string for @ tags' do
        expect(subject.parse_tags(string)).to eq ("<p><a href='/users/" + user.id.to_s + "'>@" + user.email + "</a></p>")
      end
    end

    context 'with a user NOT in the database' do
      let(:string) { '<p>@asdfasdf</p>' }

      it 'parses the string without the <a href> tag' do
        expect(subject.parse_tags(string)).to eq ( '<p>@asdfasdf</p>' )
      end
    end
  end

end