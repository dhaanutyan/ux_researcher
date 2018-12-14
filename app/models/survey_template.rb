class SurveyTemplate < ApplicationRecord
  rails_admin do
    list do
      exclude_fields :description, :data
    end
  end
end
