require 'rails_helper'

describe SurveysController do
  describe 'surveys#new' do
    it 'should render the new survey template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'surveys#show' do
    let(:survey) {Survey.create(title: "test")}
    it 'should render the show template' do
      get :show, id: survey
      expect(response).to render_template :show
    end
  end

  describe 'surveys#create' do
    let(:user) {User.create(email: 'test@example', password: '123')}

    it 'should redirect to the new survye after its created' do
      session[:user_id] = user.id
      post :create, survey: {title: "test survey"}
      expect(response).to redirect_to survey_path(Survey.last.id)
    end
  end
end
