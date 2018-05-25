Rails.application.routes.draw do
  get 'reviews/create'

  devise_for :users

  resources :profiles do
    resources :contracts, only:[:new, :create]
    resources :reviews, only: [:create, :destroy, :edit, :update]
  end

  resources :companies
  resources :contracts, only:[:index, :show, :edit, :update, :destroy]
  get 'options', to: 'pages#options'
  root to: 'pages#home'
end
