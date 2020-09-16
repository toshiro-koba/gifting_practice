Rails.application.routes.draw do
  devise_for :users
  root to: "gifts#index"
  resources :users, only: [:edit, :update]
end
