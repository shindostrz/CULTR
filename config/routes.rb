CULTR::Application.routes.draw do

  root to: 'convos#index'

  resources :users, except: :index do
    resources :convos
  end

  get '/response/:id' => 'convos#create_response'

  delete '/response/:id/destroy' => 'responses#destroy'

  resources :sessions, only: [:new, :create]

  get '/map' => 'convos#map'

  get '/logout' => 'sessions#destroy'

end
