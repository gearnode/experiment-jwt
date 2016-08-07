Rails.application.routes.draw do

  resources :posts
  resources :sessions, only: :create

end
