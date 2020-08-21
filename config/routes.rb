Rails.application.routes.draw do
  devise_for :users
  resources :users do
    resources :events
  end
  resources :events
  root 'events#index'
end
