Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/administration', as: 'rails_admin'
  devise_for :admins
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get 'surveys/perform', action: :perform, controller: :surveys
  post 'surveys/save_result', action: :save_result, controller: :surveys
  get 'surveys/conclude', action: :conclude, controller: :surveys
end
