Rails.application.routes.draw do
  devise_for :users
  root 'prototypes#index'

  resources :prototypes do
    resources :comments, except: [:show, :index, :new]
    resources :likes, only: [:create, :destroy]
  end
  resources :tags
  resources :users, only: [:show, :edit, :update]
end
