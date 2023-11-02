Rails.application.routes.draw do
  root "books#index"
  resources :books
  devise_for :users
  get "up" => "rails/health#show", as: :rails_health_check
end
