require 'rails_helper'

feature 'User auth' do
  given!(:user) { User.create(email: "bob@bob.com", password: "pants") }

  it 'should login a user' do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
    greeting = "Hello #{user.email}!"
    expect(page).to have_content greeting
  end

  it 'should logout a user' do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
    click_button 'Logout'
    expect(page).to have_content "Click to create account"
  end

end
