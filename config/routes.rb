Rails.application.routes.draw do
  get 'airlock/index'

  resources :posts
  
  root 'airlock#index'






  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
