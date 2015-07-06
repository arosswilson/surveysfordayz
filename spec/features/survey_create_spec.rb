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
  given!(:survey) {Survey.new(title: "our dear lord", user_id: user.id)}
  given!(:question) {Question.new(text: "totes mcgee", survey_id: survey.id)}
  given!(:choice) {Choice.new(text: "sdflkjsfdlejoiwewe", question_id: question.id)}
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

  it 'should show added title' do
    click_button "Create a Survey"
    fill_in 'Title', with: survey.title
    click_button "Add title"
    survey.save
    title = "#{survey.title}"
    expect(page).to have_content title
  end

  it 'should show added question' do
    click_button "Create a Survey"
    fill_in 'Title', with: survey.title
    click_button "Add title"
    survey.save
    fill_in 'question_text', with: question.text
    click_button "Add question"
    question.save
    first_q = survey.questions.first
    expect(page).to have_content first_q
  end

  it 'should show added choice' do
    click_button "Create a Survey"
    fill_in 'Title', with: survey.title
    click_button "Add title"
    survey.save
    fill_in 'question_text', with: question.text
    click_button "Add question"
    question.save
    fill_in 'text', with: choice.text
    click_button "create choice"
    binding.pry
    first_c = question.choices.last
    expect(page).to have_content first_c
  end
end
