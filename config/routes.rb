Comments::Application.routes.draw do

  resources :kids_night_outs
  resources :kids_night_outs
  resources :bff_dance_parties
  resources :employment_applications, except: [:edit]
  resources :recital_sign_ups
  resources :parties, except: [:show]
  resources :camps
  root :to => 'static#index'

  get '(errors)/:status', to: 'errors#show', constraints: {status: /\d{3}/}  

  get 'coaches/type/:name' => "coaches#type"
  get 'coaches/loc/:name' => "coaches#loc"
  get 'coaches/past_employees' => "coaches#past_employees"

  get 'recital_ads/ad_select'
  get 'recital_ads_by_year/:year' => "recital_ads#by_year"
  get 'recital_ad_mailer/:id' => 'recital_ads#order_confirmation'

  get 'datenights/edit' => 'datenights#edit'

  # get 'choose_survey' => 'survey_results#choose_survey' 
  # get 'survey_result_for/:name' => 'survey_results#survey_results_for' 
  # get 'survey_results/:id' => 'survey_results#show' 

  resources :comments
  resources :kid_quotes
  # resources :schedules
  resources :coaches
  resources :users
  resources :sessions
  resources :levels
  resources :recital_ads
  resources :recital_ad_types
  resources :promo_slides
  resources :surveys
  resources :survey_results
  resources :datenights
  resources :absents
  resources :worlds
  resources :tricks_u_categories
  resources :tricks_u_videos
  resources :website_pdfs
  resources :discontinue_notices
  resources :bubble_contents
  # resources :training_videos

  %w[gymnastics tumblebunnies tag dance preschool_dance swim locations site_comments competitive birthdays princess_party campus recital_ad_order_thank_you survey_thank_you recital_info thankyou our_story polkadots indexold nasa safety_video food_drive].each do |page|
    get page, controller: "static", action: page
  end

  get 'signup', to: 'users#new'
  get 'login', to: 'sessions#new'
  get 'logout', to: 'sessions#destroy'
  # get 'whereintheworld', to: 'worlds#new'
  get 'tricksu', to: 'tricks_u_videos#index'

  get 'tricksu/:category' => "tricks_u_videos#index"

  # get 'survey/:id/start' => 'survey_results#new', as: 'start_survey'
  # get 'survey/:id/results' => 'survey_results#results_page', as: 'results_page'
  
  get 'levels/jr_request/:level_id' => "levels#get_jr_classes"
  get 'parties/jr_request/:party_id' => "parties#get_jr_parties"
  get 'parties/jr_request_all' => "parties#get_jr_parties_all"
  
  patch 'employment_applications/:id/complete_interview', to: "employment_applications#complete_interview"
  post 'employment_applications/:id', to: "employment_applications#archive"
  get 'employment', to: 'employment_applications#new'
end