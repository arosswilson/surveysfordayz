require 'rails_helper'


describe SurveysController do
  let!(:user) {User.create(:email => "bob@bob.com", :password => "something")}
  let!(:survey) {Survey.create(:title => "tits mcgee", :user_id => user.id)}

  describe "GET surveys/new" do
    it "should display new survey page" do
     get :new
     expect(response).to be_ok
     expect(response).to render_template(:new)
    end
  end

  describe "POST /surveys" do
    it "should create a new survey" do
      session[:user_id] = user.id
      post :create, survey: {title: survey.title, user_id: user.id}
      expect(response).to be_redirect
      # expect(response).to redirect_to(survey)
    end
  end

end
