Rails.application.routes.draw do

  devise_for :contractors
  resources :contractors, only: [:show, :edit, :update]
 
  devise_for :users
  root to: "categories#index"
  resources :categories, only: [:show, :edit, :update]

end
