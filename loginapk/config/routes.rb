Rails.application.routes.draw do
  
  namespace:api do
  	resources :users
  end

  root 'home#index'
  resources :users
  resources :sessions, only: [:new, :create, :destroy]

  get 'login', to:'sessions#new',as:'login'
  get 'signup', to:'users#new', as:'signup'
  post 'sessions/new', to: 'sessions#create'
  get 'logout', to:'sessions#destroy', as:'logout'

  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
