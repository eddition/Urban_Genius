UrbanGenius::Application.routes.draw do

  root to: 'users#index'
  get '/signup' => "users#new"
  get '/list' => "words#list"
  get '/logout' => "session#destroy"
  get '/login' => "session#new"
  post '/login' => "session#create"
  get '/search' => "songs#search"
  post '/songs' => "songs#results"

  resources :users
  resources :songs
  resources :words

end
