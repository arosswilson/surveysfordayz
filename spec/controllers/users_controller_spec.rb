require 'rails_helper'

describe UsersController do
  describe 'Users#new' do
    it "renders the new template" do
      get :new
      expect(response).to render_template :new
    end
  end
end
