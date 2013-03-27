Ratemyrepo::Application.routes.draw do

  get "users/show"

  get '/signin' => 'sessions#new', :as => :signin
  match '/signout', :to => 'sessions#destroy', :as => :signout
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'

  get '/settings' => 'settings#index', :as => :settings
  post '/settings' => 'settings#update'

  get '/:username' => 'users#show', :as => :user
  get '/:username/:repo' => 'repo#show'

  root :to => 'pages#home'

end
