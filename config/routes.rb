Rails.application.routes.draw do

  get 'page/home'
  get 'page/contact'
  root 'users#new'
  resources :attendances
  resources :events
  resources :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
