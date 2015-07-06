require 'rails_helper'

describe User do
  let(:user) {User.new(email: 'bob@example.com', password: '123')}

  it "should exist" do
    expect(User).to be_truthy
  end

  it "should have an email address" do
    expect(user.email).to eq 'bob@example.com'
  end

  it "should be able to create a new user" do
    expect{visit new_user_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Sign Up'
    }.to change(User, :count).by(1)
  end

  it "should not create a user email is blank" do
    expect{visit new_user_path
    fill_in 'Email', with:  ""
    fill_in 'Password', with: user.password
    click_button 'Sign Up'
    }.not_to change(User, :count)
  end
end
