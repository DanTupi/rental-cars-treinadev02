Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root to: 'home#index'
  resources :manufacturers, only: [:index, :show, :new, :create, :edit, :update]
  resources :subsidiaries
  resources :car_categories, only: [:index, :show, :new, :create, :edit, :update]
  resources :car_models, only: [:index, :show, :new, :create, :edit, :update]
  resources :clients, only: [:index, :new, :create]
  resources :cars, only: [:index, :show, :new, :create]
  resources :rentals, only: [:index, :new, :create, :show] do
    get 'search', on: :collection
    post 'start', on: :member
  end

end
