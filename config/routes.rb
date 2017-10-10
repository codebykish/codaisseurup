Rails.application.routes.draw do

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  devise_for :users

  resources :users, only: [:show]
  resources :events, except: [:destroy]
end
