Rails.application.routes.draw do
  resources :users, only: [:create]

  post '/login', to: 'auth#create'
  post '/auto_login', to: 'auth#auto_login'
  get '/me', to: 'users#show'
  get '/saved_user_weather_current', to: 'weather#saved_user_current'

end
