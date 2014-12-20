Rails.application.routes.draw do
  root to: "application#profile"
  get '/home',to: 'application#home'
  get '/profile',to: 'application#profile'
  get '/logout',to: 'application#logout'
  get '/login',to: 'application#login'
  post '/login',to: 'application#login'
  post '/register',to: 'application#register'
  get '*path', to: 'application#profile'
  end
