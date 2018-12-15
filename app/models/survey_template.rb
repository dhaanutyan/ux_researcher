class SurveyTemplate < ApplicationRecord
  has_many :surveys, foreign_key: :template_id, dependent: :destroy

  rails_admin do
    exclude_fields :surveys

    list do
      exclude_fields :description, :data
    end

    update do
      configure :data do
        visible do
          !bindings[:object].surveys.exists?
        end
      end
    end
  end
end
