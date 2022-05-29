Rails.application.routes.draw do
  devise_for :users
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  get 'bills/index'
  get 'bills/new'
  get 'bill_groups/index'
  get 'bill_groups/new'
  get 'bill_group/index'
  get 'bill_group/new'
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  root 'bill_groups#index'
end
