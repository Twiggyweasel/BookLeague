Rails.application.routes.draw do
  devise_for :users
  resources :books do
    get "search", to: "books#search"
  end
  resources :clubs do
    scope module: :clubs do
      resources :memberships
      resources :recommendations
    end
  end
  resources :users do
    scope module: :users do 
      resources :clubs, only: %w[index destroy]
      resources :memberships, only: %w[index destroy]
      resources :recommendations
    end
  end





  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
