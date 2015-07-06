require 'rails_helper'

describe SessionsController do

  describe "GET /new" do
    it "should take to login page" do
     get :new
     expect(response).to be_ok
     expect(response).to render_template(:new)
    end
  end

end
