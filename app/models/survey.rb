class Survey < ApplicationRecord
  belongs_to :user
  belongs_to :template, class_name: 'SurveyTemplate'

  rails_admin do
    list do
      exclude_fields :token, :result
    end

    create do
      exclude_fields :token, :result
    end

    update do
      exclude_fields :token, :result
    end
  end
end
