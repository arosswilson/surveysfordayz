require 'rails_helper'


describe SurveysController do
  let!(:user) {User.create(:email => "bob@bob.com", :password => "something")}
  let(:survey) {Survey.new(:title => "tits mcgee", :user_id => user.id)}

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
      # post :create, survey: {title: "title", user_id: user.id}
      # kind ugly...
      #  expect(response).to redirect_to(user.surveys.last)
      # kinda code gross to know you can slurp an @-variable by using assigns
      # expect(response).to redirect_to(assigns(:survey))
      # a more verbose way of doing it...
      expect {
        post :create, survey: {title: "title", user_id: user.id}
      }.to change(Survey, :count).by(1)
      expect(response).to be_redirect
    end
  end

end
