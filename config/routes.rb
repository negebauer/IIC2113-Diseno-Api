Rails.application.routes.draw do
  root to: 'application#index'

  resources :choices, only: [:index]
  resources :communicate, only: [:index]
  resources :difussion, only: [:index]
  resources :evaluate, only: [:index]
  resources :experiences, only: [:index]
  resources :feedback, only: [:index]
  resources :goal, only: [:index]
  resources :methodologies, only: [:index]
  resources :plan, only: [:index]
  resources :question, only: [:index]
  resources :realize, only: [:index]
  resources :resource, only: [:index]
  resources :selections, only: [:index]
  resources :sessions, only: [:create]
  resources :survey, only: [:index]
  resources :users, only: [:index]
end
