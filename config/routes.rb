# frozen_string_literal: true

Rails.application.routes.draw do
  root 'curiosity_cards#index'

  devise_for :users

  resources :curiosity_cards do
    resources :comments
    resources :statement, only: %i[create]
  end

end
