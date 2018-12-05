class Survey < ApplicationRecord
  belongs_to :user
  belongs_to :template, class_name: 'SurveyTemplate'
end
