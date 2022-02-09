# frozen_string_literal: true

Rails.application.routes.draw do
  root 'curiosity_cards#index'
  devise_for :users

  resources :games, except: %i[edit update destroy] do
    resources :questions, only: %i[edit update]
  end

  resources :curiosity_cards do
    resources :comments
    resource :statement, only: %i[update destroy]
    patch "publish", to: "curiosity_cards/publishes#update", as: :publish
    delete "publish", to: "curiosity_cards/publishes#destroy", as: :unpublish
  end
end
