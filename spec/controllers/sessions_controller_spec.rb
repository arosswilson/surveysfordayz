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
    it "should allow login" do
      post :create, user: {email: user.email, password: user.password}
      expect(response).to be_redirect
      expect(response).to redirect_to(user)
    end

    it "should fail login" do
      post :create, user: {email: user.email, password: "blah blah blah"}
      expect(response).to be_redirect
      expect(response).to redirect_to(root_path)
    end
  end

  describe "session[:user_id]?" do
    it "session should exist" do
      post :create, user: {email: user.email, password: user.password}
      expect(session[:user_id]).to eq(user.id)
    end
  end

  describe "destroy /sessions" do
    it "should destroy session" do
      post :create, user: {email: user.email, password: user.password}
      delete :destroy
      expect(session[:user_id]).to be_nil
      expect(response).to redirect_to(root_path)
    end
  end
end
