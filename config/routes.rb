Rails.application.routes.draw do
  devise_for :users
  root "static_pages#home"
  get "/search",            to: "static_pages#search"
  get "/help",              to: "static_pages#help"
  resources :topics,        only: [:index, :show, :new, :create]
  resources :subcategories, only: [:show]
  resources :responses,     only: [:create]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
