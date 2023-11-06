Rails.application.routes.draw do
  root "books#index"
  resources :books
  devise_for :users, skip: [:password, :registrations ]

  as :user do
    get "users/sign_up", to: "devise/registrations#new", as: :new_user_registration
    post "users", to: "devise/registrations#create", as: :user_registration
  end

  get "up" => "rails/health#show", as: :rails_health_check
end
