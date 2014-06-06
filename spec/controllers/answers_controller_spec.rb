require 'spec_helper'

describe AnswersController, :type => :controller do
  let(:question) { FactoryGirl.create :question }
  let(:answer) {
    question.answers.create!(:answer => 'Test')
  }
  
  describe '#new' do
    it 'assigns a new answer to @answer' do
      get :new, :question_id => question.id
      expect(assigns(:answer)).to be_a_new(Answer)
    end
  end

  describe '#create' do
    context 'with valid attributes' do
      it 'saves the new answer in the database' do
        expect{
          post :create, :question_id => question.id, :answer => FactoryGirl.attributes_for(:answer)
        }.to change(Answer, :count).by(1)
      end

      it 'does not render a html template' do
        post :create, :question_id => question.id, :answer => FactoryGirl.attributes_for(:answer)
        expect(response.body).to be_blank
      end
    end
    
    context 'with invalid attributes' do
      it 'does not save the new answer in the database' do
        expect{
          post :create, :question_id => question.id, :answer => FactoryGirl.attributes_for(:invalid_answer)
        }.to_not change(Answer, :count)
      end
    end
  end

  describe '#destroy' do
    it 'deletes the answer from the database' do
      @answer = answer
      expect{
        delete :destroy, :question_id => question.id, :id => @answer.id
      }.to change(Answer, :count).by(-1)
    end

    it 'does not render a html template' do
      @answer = answer
      delete :destroy, :question_id => question.id, :id => @answer.id
      expect(response.body).to be_blank
    end
  end

end