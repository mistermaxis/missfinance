# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  
  get 'home/index'
  get 'notices/success/:id', to: 'notices#success', as: 'success'
  get 'notices/failure/:id', to: 'notices#failure', as: 'failure'

  resources :cats, only: [:index, :show, :new, :create]
  resources :bills, only: [:new, :create]
  
  root 'home#index'
end
