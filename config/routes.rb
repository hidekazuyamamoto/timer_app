Rails.application.routes.draw do
  devise_for :users
  
  resources :timers
  resources :timer_titles
  root to:'timers#index'
end
