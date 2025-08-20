# frozen_string_literal: true

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/* (remember to link manifest in application.html.erb)
  # get "manifest" => "rails/pwa#manifest", as: :pwa_manifest
  # get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker

  # Defines the root path route ("/")
  root "application#index"

  devise_for :users, skip: :all

  devise_scope :user do
    get :sign_in, to: "sessions#new"
    post :sign_in, to: "sessions#create"
    delete :sign_out, to: "sessions#destroy"
  end

  scope :dashboard do
    get "/", to: "dashboards#index", as: "dashboard"
  end
end
