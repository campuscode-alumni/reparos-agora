Rails.application.routes.draw do

  devise_for :contractors

  devise_for :users
  root to: "categories#index"

  resources :categories, only: [:show, :edit, :update]

  resources :contractors, only: [:show, :edit, :update] do
    resources :estimates, only: [:new, :create]
  end

  resources :estimates, only: [:show, :index, :update] do
    get 'approve', on: :member
  end
end
