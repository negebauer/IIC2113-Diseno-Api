Rails.application.routes.draw do
  root to: 'application#index'

  resources :comunicates
  resources :satisfactions
  resources :surveys
  resources :suggestions
  resources :questions
  resources :evaluations
  resources :blogs
  resources :implements
  resources :diffusions
  resources :selection_plans
  resources :others
  resources :resources
  resources :places
  resources :members
  resources :plans
  resources :selections
  resources :methoods
  resources :experiences
  post '/experiences/:id/users' => 'experiences#invite'
  resources :users, except: [:create]
  post '/signup', to: 'users#create'
  post   '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'
end
