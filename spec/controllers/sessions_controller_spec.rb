require 'rails_helper'

describe SessionsController do
  let!(:user) {User.create(:email => "bob@bob.com", :password => "something")}

  describe "GET /new" do
    it "should take to login page" do
     get :new
     expect(response).to be_ok
     expect(response).to render_template(:new)
    end
  end

  describe "POST /sessions" do
  # let!(:user) {User.create(:email => "bob@bob.com", :password => "something")}
    it "should allow login" do
      post :create, user: {email: user.email, password: user.password}
      expect(response).to be_redirect
      expect(response).to redirect_to(user)
    end
  end

  # describe "session[:user_id]?" do
  # let!(:user) {User.create(:email => "bob@bob.com", :password => "something")}
  #   it "session should exist" do
  #     post :create, user: {email: user.email, password: user.password}
  #     expect(response).to be_redirect
  #     expect(response).to redirect_to(user)
  #   end
  # end
end
