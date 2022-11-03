Rails.application.routes.draw do
  devise_for :users
  root to: "anniversaries#index"
  resources :anniversaries, only: [:index] 
end
