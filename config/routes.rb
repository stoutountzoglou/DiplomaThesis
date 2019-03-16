Rails.application.routes.draw do
  get '/sign_up', to: 'users#create'
  get '/edit_user', to: 'users#update'
  get '/create_trip', to: 'trips#create'
  get '/edit_trip', to: 'trips#update'
  get '/create_review', to: 'reviews#create'
  get '/edit_review', to: 'reviews#update'

  get '/trip_search', to: 'trips#trip_search'
  get '/user_search', to: 'users#user_search'
  get '/profile', to: 'users#show'
end
