Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  devise_for :users
  resources :users, only: [:index, :show] do
    resources :posts, only: [:index,  :new, :create, :show] do
      resources :comments, only: [:new, :create]
      resources :likes, only: [:create]
    end
  end

  # api routes
  namespace :api do
    resources :users, only: [:index, :show] do
      resources :posts, only: [:index], format: :json do
        resources :comments, only: [:index, :create], format: :json
      end
    end
  end

  # Defines the root path route ("/")
  root "users#index"
end
