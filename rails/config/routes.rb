# frozen_string_literal: true

Rails.application.routes.draw do
  mount KomachiHeartbeat::Engine => '/ops'
  get 'company/:branch_id', to: 'companies#show', as: 'company'
  root 'homes#index'
  resources :reviews, only: [:show]
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
