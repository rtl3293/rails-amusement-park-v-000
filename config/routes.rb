Rails.application.routes.draw do

  resources :sessions
  resources :users
  root 'welcome#home'
  get '/signin' => 'sessions#new', as: 'login'
end
