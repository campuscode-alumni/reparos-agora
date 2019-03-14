Rails.application.routes.draw do
  devise_for :contractors
  
  root to: 'categories#index'
  
  
end
