CULTR::Application.routes.draw do

  root to: 'convos#index'

  resources :users, except: :index

  resources :convos

  get '/response/:id' => 'convos#create_response'

  resources :sessions, only: [:new, :create]

  get '/map' => 'convos#map'

  get '/logout' => 'sessions#destroy'

end
