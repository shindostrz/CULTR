CULTR::Application.routes.draw do

  root to: 'convos#index'

  resources :users, except: :index

  resources :convos, defaults: {format: :json}

  get '/response/:id' => 'convos#create_response'

  delete '/response/:id/destroy' => 'convos_users#destroy'

  resources :sessions, only: [:new, :create]

  get '/logout' => 'sessions#destroy'

end
