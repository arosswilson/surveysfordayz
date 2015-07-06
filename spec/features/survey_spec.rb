require 'rails_helper'

describe Survey do
  let(:survey) { Survey.new(title: "Example")}

  it 'should exist' do
    expect(Survey).to be_truthy
  end

  it "is valid with a title" do
    expect(survey.valid?).to be_truthy
  end

  it "is invalid without a title" do
    survey = Survey.new(title: nil)
    survey.valid?
    expect(survey.errors[:title]).to include("can't be blank")
  end

  it "should create a Survey object when created" do
    expect{survey.save}.to change(Survey, :count).by(1)
  end
end
