Rails.application.routes.draw do
  resources :users

  resources :reviews
  get '/user_search', to: 'users#user_search'

  resources :trips
  get '/trip_search', to: 'trips#trip_search'
  get 'dashboard', to: 'trips#dashboard'

end
