# frozen_string_literal: true

Rails.application.routes.draw do
  root 'curiosity_cards#index'
  devise_for :users

  resources :curiosity_cards do
    resources :comments
    resource :statement, only: %i[update]
    patch "publish", to: "curiosity_cards/publishes#update", as: :publish
    delete "publish", to: "curiosity_cards/publishes#destroy", as: :unpublish
  end

  resources :games, only: %i[index show update]
  resources :questions, only: %i[show]
end
