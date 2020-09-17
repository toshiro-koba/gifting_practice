Rails.application.routes.draw do
  devise_for :users
  root to: "messages#index"
  resources :users, only: [:edit, :update, :show] do
    resources :gifts, only: [:index, :new, :create]
  end
end
