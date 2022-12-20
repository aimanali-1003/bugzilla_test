# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  resources :projects do
    resources :bugs do
      member do
        patch :status
      end
    end
  end
  namespace :api do
    namespace :v1 do
      resources :projects do
        resources :bugs
      end
    end
  end
  root 'home#index'
end
