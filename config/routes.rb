Rails.application.routes.draw do
  devise_for :users
  get 'airlock/index'

  resources :posts
  resources :comments

  root 'airlock#index'






  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
