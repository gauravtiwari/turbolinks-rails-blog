Rails.application.routes.draw do

  root to: 'posts#index'

  # User session management
  get '/login' => 'sessions#new'
  post '/login' => 'sessions#create'
  get '/logout' => 'sessions#destroy'

  # User signup and create
  get '/signup' => 'users#new'
  post '/users' => 'users#create'

  resources :posts, only: [:show, :index] do
    resources :comments
  end

  resources :votes, only: [:create, :destroy]

end
