Comments::Application.routes.draw do

  #root :to => 'home#index'

  resources :comments
  resources :users
  resources :sessions 

  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

end
