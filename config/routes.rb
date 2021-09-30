Rails.application.routes.draw do
  devise_for :users
  
  resources :timers
  resources :timer_titles do
    resources :timer_count
  end
  root to:'timers#index'
end
