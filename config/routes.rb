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
  
  match 'schedules/gb_gym'
  match 'schedules/gb_tb'
  match 'schedules/gb_dance'

  match 'schedules/fol_gym'
  match 'schedules/fol_tb'
  match 'schedules/fol_dance'
  match 'schedules/fol_swim'

  match 'schedules/sac_gym'
  match 'schedules/sac_tb'
  match 'schedules/sac_dance'

  match 'schedules/by_gym'


  match 'coaches/gb'
  match 'coaches/fol'
  match 'coaches/sac'

  resources :schedules
  resources :coaches
  resources :users
  resources :sessions
  resources :levels


  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

end
