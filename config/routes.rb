# frozen_string_literal: true

Rails.application.routes.draw do
  post '/projects/:project_id/bugs/:id', to: 'bugs#pick_drop', as: :pick_drop
  devise_for :users
  resources :projects do
    match 'delete/:user_id' => 'projects#delete', :as => 'delete', via: %i[patch]
    resources :bugs do
      member do
        #post :pick_drop
        post :status
      end
    end
  end
  root 'home#index'
end
