require 'rails_helper'

describe SessionsController do
  describe 'sessions#new' do
    it 'should render the new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'sessions#create' do
    let(:user) {User.create(email: 'test@example.com', password: '123')}

    it 'should set session id if user logs in' do
      post :create, {user: {email: user.email, password: user.password} }
      expect(session[:user_id]).to eq user.id
    end

    it 'should not set a session if the login is incorrect' do
      post :create, {user: {email: user.email, password: 'wrong'}}
      expect(session[:user_id]).to be_nil
    end

    it 'user does not exist, session should not be created' do
      post :create, {user: {email: nil, password: nil}}
      expect(session[:user_id]).to be_nil
    end
  end

  describe 'session#destroy' do
    it 'should clear session when the user logs out' do
      delete :destroy
      expect(session.empty?).to be_truthy
    end
  end
end
