Rails.application.routes.draw do

  devise_for :contractors
 
  devise_for :users
  root to: "categories#index"
  resources :categories, only: [:show]
  resources :estimates, only: [:new, :create, :show, :index] do

    get 'approve', on: :member

  end


end
