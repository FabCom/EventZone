Rails.application.routes.draw do

  get 'pages/index'
  get 'pages/contact'
  root to: 'pages#index'
  devise_for :users
  resources :attendances
  resources :events
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
