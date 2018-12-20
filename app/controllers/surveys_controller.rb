class SurveysController < ApplicationController
  def perform
    if session[:current_survey_id]
      @survey = Survey.find(session[:current_survey_id])
    else
      @survey = Survey.find_by(token: params[:token])
      session[:current_survey_id] = @survey.id
    end
  end

  def save_result
    @survey = Survey.find(session[:current_survey_id])
    result = Hash.new

    JSON.parse(params[:result]).each.with_index(1) do |step, index|
      result["step#{index}"] = step
    end

    @survey.result = result
    @survey.save!

    redirect_to action: :conclude
  end

  def conclude

  end
end
