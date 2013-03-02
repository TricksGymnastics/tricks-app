Comments::Application.routes.draw do

  


  root :to => 'home#index'

  resources :comments do
    collection do
      get '/random_comment'
    end
  end

  resources :kid_quotes do
    collection do
      get '/random_quote'
    end
  end
  
  match 'schedules/by_gym'
  resources :schedules
  resources :coaches
  resources :users
  resources :sessions
  resources :levels


  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

end
