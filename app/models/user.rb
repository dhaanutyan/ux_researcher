class User < ApplicationRecord
  rails_admin do
    list do
      exclude_fields :description
    end
  end
end
