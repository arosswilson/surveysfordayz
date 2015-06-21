class QuestionsController < ApplicationController
  def create
    @question = Question.create(question_params)
    @choice = Choice.new
    redirect_to :back #double check this later
  end

  def form
    @survey = Survey.find(params[:data])
    render partial: 'surveys/question', locals: { question: Question.new }
  end

  def destroy
    Question.find_by(id: params[:id]).destroy
    redirect_to :back
  end

  private
    def question_params
      params.require(:question).permit(:text, :survey_id)
    end
end
