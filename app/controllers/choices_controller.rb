class ChoicesController < ApplicationController
  def create
    if request.xhr?

      @survey = Survey.find_by(id: params[:survey_id])
      @choice = Choice.create(text: params[:text], question_id: params[:question_id])
      render partial: "choices/choice_text", locals: {choice: @choice, survey: @survey}
    end
    # @choice = Choice.create(choice_params)
    # redirect_to :back
  end

  def destroy
    Choice.find_by(id: params[:id]).destroy
    redirect_to :back
  end

  private
    def choice_params
      params.permit(:text, :question_id)
    end
end
