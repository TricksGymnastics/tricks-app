Comments::Application.routes.draw do

  resources :survey_results


  resources :promo_slides


  root :to => 'static#index'

  match 'schedules/choose'  
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

  match 'coaches/type/:name' => "coaches#type"
  match 'coaches/loc/:name' => "coaches#loc"
  match 'coaches/past_employees' => "coaches#past_employees"

  match 'recital_ads/ad_select'

  resources :comments
  resources :kid_quotes
  resources :schedules
  resources :coaches
  resources :users
  resources :sessions
  resources :levels
  resources :recital_ads
  resources :recital_ad_types
  resources :surveys

  %w[gymnastics dance swim events locations site_comments competitive teamgym birthdays princess_party datenights camps dancecamps campus employment 
    forms gymnastics25 missing nutcracker polkadots recital_ad_order_thank_you survey_thank_you summer thankyou tricksu turkeycamp underconstruction].each do |page|
    get page, controller: "static", action: page
  end

  match 'dance_company' => 'dance_company#index'
  %w[index about auditions empty_page events gallery].each do |page|
    get 'dance_company/'+page, controller: 'dance_company', action: page
  end

  get 'database', to: 'static#app_landing'
  get 'signup', to: 'users#new', as: 'signup'
  get 'login', to: 'sessions#new', as: 'login'
  get 'logout', to: 'sessions#destroy', as: 'logout'

  get 'quiz/:name', to: 'surveys#take_the_quiz', as: 'quiz'
  match 'survey/:id/start' => 'survey_results#new', as: 'start_survey'
  match 'survey/:id/results' => 'survey_results#results_page', as: 'results_page'


end
