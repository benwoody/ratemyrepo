Ratemyrepo::Application.routes.draw do

  get '/signin' => 'sessions#new', :as => :signin
  match '/signout', :to => 'sessions#destroy', :as => :signout
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'

  get '/about' => 'pages#about'

  get '/settings' => 'settings#index', :as => :settings
  post '/settings' => 'settings#update'

  get '/:username' => 'users#show', :as => :user
  get '/:username/:repo' => 'repos#show', :repo => /[A-Za-z0-9\.\_\-]+?/, :as => :repo

  root :to => 'pages#home'

end
