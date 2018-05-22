Rails.application.routes.draw do
  devise_for :users
  resources :profiles do
    resources :contracts, only:[:new, :create]
  end
  resources :companies
  resources :contracts, only:[:index, :show, :edit, :update, :destroy]
  get 'options', to: 'pages#options'
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
