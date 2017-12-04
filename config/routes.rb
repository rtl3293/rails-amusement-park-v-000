Rails.application.routes.draw do

  resources :attractions
  resources :sessions
  resources :users
  resources :rides
  root 'welcome#home'
  get '/signin' => 'sessions#new', as: 'login'
end
