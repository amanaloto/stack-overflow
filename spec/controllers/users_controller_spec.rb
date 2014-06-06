require 'spec_helper'

describe UsersController, :type => :controller do
  let(:user) { FactoryGirl.create(:user) }

  describe '#new' do
    it 'assigns a new user to @user' do
      get :new
      expect(assigns(:user)).to be_a_new(User)
    end

    it 'redirects to user/new view' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    context 'with valid attributes' do
      it 'saves the user to the database' do
        expect{
          post :create, :user => FactoryGirl.attributes_for(:user)
        }.to change(User, :count).by(1)
      end

      it 'redirects to new_session_path' do
        post :create, :user => FactoryGirl.attributes_for(:user)
        expect(response).to redirect_to(new_session_path)
      end
    end

    context 'with invalid attributes' do
      it 'does not save to the database' do
        expect{
          post :create, :user => FactoryGirl.attributes_for(:invalid_user)
        }.to_not change(User, :count)
      end

      it 'rerenders the new action' do
        post :create, :user => FactoryGirl.attributes_for(:invalid_user)
        expect(response).to render_template :new
      end
    end
  end

  describe '#show' do
    it 'renders the user page' do
      get :show, :id => user.id
      expect(response).to render_template :show
    end
  end
end