Rails.application.routes.draw do
  devise_for :users
  
  resources :timer
  root to:'timer#index'
end
