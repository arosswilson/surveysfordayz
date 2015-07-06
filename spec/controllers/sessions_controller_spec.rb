require 'rails_helper'

describe SessionsController do

  describe "GET /new" do
    it "should take to login page" do
     get :new
    end
  end

end
