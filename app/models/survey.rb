class Survey < ApplicationRecord
  belongs_to :user
  belongs_to :template, class_name: 'SurveyTemplate'

  before_create :generate_token

  def generate_token
    loop do
      self.token = SecureRandom.hex(20)
      break unless Survey.exists?(token: self.token)
    end
  end

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
