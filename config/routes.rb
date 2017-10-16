Rails.application.routes.draw do

  resources :categories
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: "pages#home"

  devise_for :users

  resources :users, only: [:show]
  resources :events, except: [:destroy]
  resources :profiles, only: [:new, :edit, :create, :update]
  resources :photos

  resources :events do
    resources :registrations, only: [:create]
  end

  namespace :api do
    resources :events
  end
end
