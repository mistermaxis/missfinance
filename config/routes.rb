# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users
  
  get 'home/index'
  
  resources :cats, only: [:index, :show, :new, :create]
  resources :bills, only: [:new, :create]
  
  root 'home#index'
end
