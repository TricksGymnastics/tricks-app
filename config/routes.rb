Comments::Application.routes.draw do

  root :to => 'home#index'

  resources :comments do
    collection do
      get '/random_comment'
    end
  end

  resources :users
  resources :sessions 
  resources :kid_quotes


  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

end
