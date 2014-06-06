require 'spec_helper'

describe CommentsController, :type => :controller do
  let(:answer) { FactoryGirl.create :answer}
  let(:comment) {
    answer.comments.create!(:comment => 'Test')
  }
  let(:page) { FactoryGirl.generate(:random_page) }

  describe '#index' do
    it 'stores the paginated comments to @comments' do
      get :index, :answer_id => answer.id, :page => page
      expect(assigns(:comments)).to eq(answer.comments.page(page).per(5))
    end

    it 'stores the count of next page to @count' do
      get :index, :answer_id => answer.id, :page => page
      expect(assigns(:count)).to eq(answer.comments.page(page+1).per(5).count)
    end

    it 'does not render a html template' do
      get :index, :answer_id => answer.id, :page => page
      expect(response.body).to be_blank
    end
  end

  describe '#new' do
    it 'assigns a new comment to @comment' do
      get :new, :answer_id => answer.id
      expect(assigns(:comment)).to be_a_new(Comment)
    end

    it 'does not render a html template' do
      get :new, :answer_id => answer.id
      expect(response.body).to be_blank
    end
  end

  describe '#create' do
    context 'with valid attributes' do
      it 'saves the record to the database' do
        expect{
          post :create, :answer_id => answer.id, :comment => FactoryGirl.attributes_for(:comment)
        }.to change(Comment, :count).by(1)
      end

      it 'does not render a html template' do
        post :create, :answer_id => answer.id, :comment => FactoryGirl.attributes_for(:comment)
        expect(response.body).to be_blank
      end
    end

    context 'with invalid attributes' do
      it 'does not save the record' do
        expect{
          post :create, :answer_id => answer.id, :comment => FactoryGirl.attributes_for(:invalid_comment)
        }.to_not change(Comment, :count)
      end
    end
  end

  describe '#destroy' do
    it 'deletes the record from the database' do
      @comment = comment
      expect{
        delete :destroy, :answer_id => answer.id, :id => @comment.id
      }.to change(Comment, :count).by(-1)
    end

    it 'does not render a html template' do
      @comment = comment
      delete :destroy, :answer_id => answer.id, :id => @comment.id
      expect(response.body).to be_blank
    end
  end
end