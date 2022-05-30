# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  get 'bills/index'
  get 'bills/new'
  get 'cats/index'
  get 'cats/new'
  root 'cats#index'
end
