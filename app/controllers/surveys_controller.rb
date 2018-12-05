class SurveysController < ApplicationController
  def perform
    @survey = Survey.first#find_by(token: params[:token])
  end

  def save_result
    redirect_to action: :conclude
  end

  def conclude

  end
end
