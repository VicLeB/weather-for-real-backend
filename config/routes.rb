Rails.application.routes.draw do
  resources :posts, only: [:index, :create, :destroy]
  resources :users, only: [:create, :show]

  post '/login', to: 'auth#create'
  post '/auto_login', to: 'auth#auto_login'
  get '/me', to: 'users#show'
  get '/saved_user_weather_current', to: 'weather#saved_user_current'
  get '/search_result_weather/:location', to: 'weather#search_result_weather'
  get '/geolocation', to: 'weather#geolocation'

end
