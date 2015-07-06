class SurveysController < ApplicationController
  def new
    @survey = Survey.new
    @user_id = session[:user_id]
  end

  def create
    @survey = Survey.new(survey_params)
    if @survey.save
      @user = User.find_by(id: session[:user_id])
      @user.surveys << @survey
      redirect_to @survey
    else
      redirect_to :back
    end
  end

  def show
    @survey = Survey.find_by(id: params[:id])
    @question = Question.new
    @choice = Choice.new
    @user_id = session[:user_id]
  end

  def take
    @survey = Survey.find(params[:id])
    @user_id = session[:user_id]
  end

  def results
    @survey = Survey.find(params[:id])
  end

  def submit
    user = User.find(session[:user_id])
    survey = Survey.find(params[:id])

    taken_survey = TakenSurvey.create(user_id: user.id, survey_id: survey.id)

    params.each do |question, choice_id|
      if question.include?("question_")
        taken_survey.user_choices.build(choice_id: choice_id).save
      end
    end

    redirect_to user_path(user.id)
  end

  private
    def survey_params
      params.require(:survey).permit(:title, :user_id)
    end
end
