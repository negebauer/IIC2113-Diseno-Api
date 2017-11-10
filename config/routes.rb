Rails.application.routes.draw do
  root to: 'application#index'
  resources :comunicates
  resources :satisfactions
  resources :surveys
  resources :suggestions
  resources :questions
  resources :evaluations
  resources :implements, except: %i[index update] do
    resources :blogs, only: %i[show update]
  end
  resources :diffusions
  resources :selection_plans
  resources :others
  resources :resources
  resources :places
  resources :members
  resources :plans
  resources :methoods, only: %i[index show]
  resources :experiences do
    resources :selections, except: %i[show]
    get '/methodologies', to: 'methoods#selected', as: 'methodologies'
  end
  post '/experiences/:id/users' => 'experiences#invite'
  resources :users, except: %i[create index show]
  get '/profile', to: 'profile#index'
  post '/signup', to: 'users#create'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
