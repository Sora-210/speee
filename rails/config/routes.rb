# frozen_string_literal: true

Rails.application.routes.draw do
  mount KomachiHeartbeat::Engine => '/ops'
  resources :branches, only: [:show]
  root 'homes#index'
  resources :reviews, only: [:show]
  resources :prefectures, only: [:show], param: :name do
    resources :cities, only: [:show], param: :name
  end
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"
end
