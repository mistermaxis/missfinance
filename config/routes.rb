# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: {
    registrations: 'users/registrations',
    confirmations: 'users/confirmations',
  }
  
  get 'home/index'
  
  get 'notices/email', to: 'notices#email', as: 'email'
  get 'notices/failure', to: 'notices#generic_failure', as: 'generic_failure'
  get 'notices/success/:id', to: 'notices#success', as: 'success'
  get 'notices/failure/:id', to: 'notices#failure', as: 'failure'

  resources :cats, only: [:index, :show, :new, :create]
  resources :bills, only: [:new, :create]
  
  root 'home#index'
end
