require 'rails_helper'

feature 'User signs in' do
  given!(:user) { User.create(email: "bob@bob.com", password: "pants") }

  it 'user can log in' do
    visit root_path
    fill_in 'Email', with: user.email
    fill_in 'Password', with: user.password
    click_button 'Login'
    greeting = "Hello #{user.email}!"
    expect(page).to have_content greeting
  end
end
