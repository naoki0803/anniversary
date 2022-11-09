Rails.application.routes.draw do
  devise_for :users
  root to: "anniversaries#index"
  resources :anniversaries, only: [:index, :new, :create, :show]do
    resources :comments, only: :create
    collection do
      get 'all'
    end
  end
  resources :users, only: [:index, :show] do
    # member do
    #   get 'list'
    # end
    resources :lists, only: :index
  end
end
