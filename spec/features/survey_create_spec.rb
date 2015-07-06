require 'rails_helper'
require 'pry'

feature 'User auth' do
  given!(:user) { User.create(email: "bob@bob.com", password: "pants") }
  before(:each) do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
  end

  it 'should login a user' do
    greeting = "Hello #{user.email}!"
    expect(page).to have_content greeting
  end

  it 'should logout a user' do
    click_button 'Logout'
    expect(page).to have_link "Click to create account"
  end
end

feature 'Create survey' do
  given!(:user) { User.create(email: "bob@bob.com", password: "pants") }
  before(:each) do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
  end

  it 'should show create survey button' do
    expect(page).to have_button "Create a Survey"
  end

  it 'should take you to new survey page' do
    click_button "Create a Survey"
    expect(page).to have_button "Add title"
  end

  it 'should go back to user landing page' do
    click_button "Create a Survey"
    click_button "back"
    greeting = "Hello #{user.email}!"
    expect(page).to have_content greeting
  end


end
