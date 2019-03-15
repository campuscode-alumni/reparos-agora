Rails.application.routes.draw do

  devise_for :users
  root to: "categories#index"
  resources :categories, only: [:show]
  resources :contractors do
    resources :estimates, only: [:new, :create]
  end
  resources :estimates, only: [:show]

end
