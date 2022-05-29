# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users

  get 'bills/index'
  get 'bills/new'
  get 'bill_groups/index'
  get 'bill_groups/new'
  get 'bill_group/index'
  get 'bill_group/new'

  root 'bill_groups#index'
end
