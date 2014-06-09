require 'spec_helper'

describe SessionsController, :type => :controller do
  describe '#new' do
    it 'renders the new view' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    context 'with valid credentials' do
      let(:user) { FactoryGirl.create :user }
      before(:each){
        post :create, :email => user.email, :password => user.password
      }

      it 'sets the session[:user_id] to @user.id' do
        expect(session[:user_id]).to eq user.id
      end

      it 'redirects to questions_path' do
        expect(response).to redirect_to questions_path
      end
    end

    context 'with invalid credentials' do
      before(:each){
        post :create, :email => 'aaaaaa', :password => 'bbbbbb' 
      }

      it 'does not assign user id to session[:user_id]' do
        expect(session[:user_id]).to be_nil
      end

      it 'renders the new view instead' do
        expect(response).to render_template :new
      end
    end
  end

  describe '#destroy' do
    before(:each) { delete :destroy }

    it 'sets the session[:user_id] to nil' do
      expect(session[:user_id]).to be_nil
    end

    it 'redirects back to root' do
      expect(response).to redirect_to root_url
    end
  end
end