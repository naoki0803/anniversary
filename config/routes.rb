Rails.application.routes.draw do
  devise_for :users
  root to: "anniversaries#index"
  resources :anniversaries do
    resources :comments, only: [:create, :destroy]
    resources :likes, only: [:create, :destroy]
    collection do
      get 'search','all'
    end
  end
  resources :users, only: [:index, :show] do
    # member do
    #   get 'list'
    # end
    resources :lists, only: :index
  end
end
