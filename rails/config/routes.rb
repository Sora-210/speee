# frozen_string_literal: true

Rails.application.routes.draw do
  mount KomachiHeartbeat::Engine => '/ops'
  resources :review
  resources :review, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
