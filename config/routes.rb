CULTR::Application.routes.draw do

  root to: 'convos#index'

  resources :users, except: :index do
    resources :convos
  end

  resources :responses, except: :index

  resources :sessions, only: [:new, :create]

  get '/map' => 'convos#map'

  get '/logout' => 'sessions#destroy'

end
