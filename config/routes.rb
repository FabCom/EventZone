Rails.application.routes.draw do

  get 'files/create'
  get 'files/update'
  get 'files/destroy'
  get 'pages/index'
  get 'pages/contact'
  root to: 'pages#index'
  devise_for :users
  resources :attendances
  resources :events
  resources :users do
    resources :avatars, only: [:update, :destroy]
  end
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
