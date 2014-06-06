require 'spec_helper'

describe QuestionsController, :type => :controller do
  let(:question) { FactoryGirl.create :question }
  let(:new_question) { FactoryGirl.create :new_question }
  let(:page) { FactoryGirl.generate(:random_page) }

  describe '#index' do
    before(:each) {get :index, :page => page}

    it 'assigns the paginated list of questions to @questions' do
      expect(assigns(:questions)).to eq(Question.order(:id).page(page))
    end

    it 'renders the index view' do
      expect(response).to render_template :index
    end
  end

  describe '#show' do
    before(:each) { get :show, :id => question.id, :page => page}

    it 'assigns the requested question to @question' do
      expect(assigns(:question)).to eq(question)
    end

    it 'assigns the answers to the @question to @answers' do
      expect(assigns(:answers)).to eq(question.answers.page(page))
    end

    it 'renders the show view' do
      expect(response).to render_template :show
    end
  end

  describe '#new' do
    before(:each) { get :new }

    it 'assigns a new question to @question' do
      expect(assigns(:question)).to be_a_new(Question)
    end

    it 'renders the new view' do
      expect(response).to render_template :new
    end
  end

  describe '#create' do
    context 'with valid attributes' do
      it 'saves the question to the database' do
        expect{
          post :create, :question => FactoryGirl.attributes_for(:question)
        }.to change(Question, :count).by(1)
      end

      it 'redirects to show(@question)' do
        post :create, :question => FactoryGirl.attributes_for(:question)
        expect(response).to redirect_to assigns(:question)
      end
    end

    context 'with invalid attributes' do
      it 'does not save to the database' do
        expect{
          post :create, :question => FactoryGirl.attributes_for(:invalid_question)
        }.to_not change(Question, :count)
      end

      it 'renders the action new' do
        post :create, :question => FactoryGirl.attributes_for(:invalid_question)
        expect(response).to render_template :new
      end
    end
  end

  describe '#edit' do
    before(:each) { get :edit, :id => question.id }

    it 'assigns the question to @question' do
      expect(assigns(:question)).to eq(question)
    end

    it 'renders the edit view' do
      expect(response).to render_template :edit
    end
  end

  describe '#update' do
    context 'with valid attributes' do
      before(:each) { 
        post :update, 
          :id => question.id, 
          :question => FactoryGirl.attributes_for(:new_question)
      }

      it 'saves the record with new attributes in the db' do
        expect(assigns(:question).title).to eq(new_question.title)
        expect(assigns(:question).question).to eq(new_question.question)
      end

      it 'redirects to show(@question' do
        expect(response).to redirect_to assigns(:question)
      end
    end

    context 'with invalid attributes' do
      before(:each){
        post :update,
          :id => question.id,
          :question => FactoryGirl.attributes_for(:invalid_question)
      }

      it 'does not save the changes to the db' do
        q = Question.find(question.id)
        expect(q.title).to eq(question.title)
        expect(q.question).to eq(question.question)
      end

      it 'renders action #edit' do
        expect(response).to render_template :edit
      end
    end
  end

  describe '#destroy' do
    it 'delete the record from the database' do
      @question = question
      expect{
        delete :destroy, :id => @question.id
      }.to change(Question, :count).by(-1)
    end

    it 'redirects to questions#index' do
      @question = question
      delete :destroy, :id => @question.id
      expect(response).to redirect_to questions_url
    end
  end

  describe '#search' do
    it 'assigns the search result to @questions' do
      search = FactoryGirl.generate :random_search
      get :search, :search => search, :page => page
      expect(assigns(:questions)).to eq(Question.
                                        search_full_text(search).
                                        page(page))
    end

    let(:result1) { FactoryGirl.create :question, :title => 'result' }
    let(:result2) { FactoryGirl.create :question, :title => 'result'}

    context 'with result size not equal to 1' do
      it 'renders questions#index' do
        get :search, :search => 'result', :page => 0
        expect(response).to render_template :index
      end
    end

    context 'with result size equal to 1' do
      it 'redirects automatically to #show(@question)' do
        @unique_question = Question.find_by_title 'Unique_title'
        @unique_question ||= Question.create!(:title => 'Unique_title', :question => 'Unique_question')
        get :search, :search => @unique_question.title, :page => 0
        expect(response).to redirect_to(@unique_question)
      end
    end
  end
end