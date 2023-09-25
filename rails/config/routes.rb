# frozen_string_literal: true

Rails.application.routes.draw do
  mount KomachiHeartbeat::Engine => '/ops'
  resources :asses, only: [:create]
  get '/asses', to: 'asses#index'
  root 'homes#index'
  resources :reviews, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
