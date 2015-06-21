class SurveysController < ApplicationController
  def new

    @survey = Survey.new
  end

  def create
    if request.xhr?
      @survey = Survey.new(title: params["title"])
      if @survey.save
        render partial: "new_question", locals: {survey: @survey, question: Question.new}
      end
    else
      @survey = Survey.new(survey_params)

      if @survey.save
        # uncomment once User stuff is set
        # @user = User.find_by(id: session[:user_id])
        # @user.surveys << @survey
        redirect_to @survey
      else
        redirect_to :back
      end
    end
  end

  def show
    @survey = Survey.find_by(id: params[:id])
    @question = Question.new
    @choice = Choice.new
  end

  private
    def survey_params
      params.require(:survey).permit(:title)
    end
end
