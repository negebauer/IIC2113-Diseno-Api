Rails.application.routes.draw do
  root to: 'application#index'

  resources :implements, except: %i[index update] do
    resources :blogs, only: %i[show update]
  end
  resources :methoods, only: %i[index show]
  resources :experiences do
    resources :selections, except: %i[show]
    get '/methodologies', to: 'methoods#selected', as: 'methodologies'
    get '/plan', to: 'plans#show'
    post '/plan', to: 'plans#create'
    patch '/plan', to: 'plans#update'
  end
  post '/experiences/:id/users', to: 'experiences#invite'
  resources :users, except: %i[create index show]
  get '/profile', to: 'profile#index'
  post '/signup', to: 'users#create'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
