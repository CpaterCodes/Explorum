Rails.application.routes.draw do
  get 'airlock/index'
  root 'airlock#index'

  resources :posts
  get 'post/create'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
