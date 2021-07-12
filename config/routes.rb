Rails.application.routes.draw do
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

  get '/quote', to: 'website#quote'

  get '/google', to: 'google#maps'

  post '/watson/greetings', to: 'watson#greetings'

end

