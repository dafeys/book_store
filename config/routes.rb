Rails.application.routes.draw do
  devise_for :users
  root "books#index"
  resources :books
  get "up" => "rails/health#show", as: :rails_health_check
end
