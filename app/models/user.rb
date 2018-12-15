class User < ApplicationRecord
  has_many :surveys, dependent: :destroy

  rails_admin do
    exclude_fields :surveys

    list do
      exclude_fields :description
    end
  end
end
