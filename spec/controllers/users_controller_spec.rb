require 'rails_helper'

describe UsersController do
  describe 'Users#new' do
    it 'renders the new template' do
      get :new
      expect(response).to render_template :new
    end
  end

  describe 'Users#create' do
    it 'should create a new user' do
      post :create, {user: {email: "test@example.com", password: "123"} }
      expect(response).to redirect_to login_path
    end

    it 'should not create a new user' do
      post :create, {user: {email: "test@example.com", password: nil} }
      expect(response).to render_template :new
    end

    it 'should not create a new user if email and password are blank' do
      post :create, {user: {email: nil, password: nil} }
      expect(response).to render_template :new
    end

    it 'should not create a new user if email is blank' do
      post :create, {user: {email: nil, password: "123"}}
      expect(response).to render_template :new
    end
  end

  describe 'Users#show' do
    let(:user) {User.create(email: 'test@example', password: '123')}
    it 'should should render the show template' do
      get :show, {id: user.id}
      expect(response).to render_template :show
    end
  end
end
