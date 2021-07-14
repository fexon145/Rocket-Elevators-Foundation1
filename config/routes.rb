Rails.application.routes.draw do
  resources :interventions
  resources :leads
  devise_for :users
  resources :quotes
  get 'website/index'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root 'website#index'
  
  get '/index', to: 'website#index'
  
  get '/residential', to: 'website#residential'

  get '/commercial', to: 'website#commercial'

  get '/intervention', to: 'website#intervention'

  get '/quote', to: 'website#quote'

  get '/google', to: 'google#maps'

  post '/watson/greetings', to: 'watson#greetings'

  get 'building_take/:customer_id', to: 'interventions#building_take'

  get 'battery_take/:building_id', to: 'interventions#battery_take'

  get 'column_take/:battery_id', to: 'interventions#column_take'

  get 'elevator_take/:column_id', to: 'interventions#elevator_take'
  
end

