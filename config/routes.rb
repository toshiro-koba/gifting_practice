Rails.application.routes.draw do
  devise_for :users
  root to: "gifts#index"
end
