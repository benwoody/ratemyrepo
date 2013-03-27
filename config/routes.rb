Ratemyrepo::Application.routes.draw do

  get '/signin' => 'sessions#new', :as => :signin
  match '/signout', :to => 'sessions#destroy', :as => :signout
  match '/auth/:provider/callback', :to => 'sessions#create'
  match '/auth/failure', :to => 'sessions#failure'

  get '/settings' => 'settings#index', :as => :settings
  post '/settings' => 'settings#update'

  get '/:id' => 'users#show', :as => :user
  get '/:user_id/:id' => 'repo#show'

  root :to => 'pages#home'

end
