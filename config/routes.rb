Rails.application.routes.draw do
  namespace :users do
    get 'meetings/index'
  end
  devise_for :users
  resources :books
  
  resources :clubs do
    scope module: :clubs do
      resources :memberships
      resources :recommendations
      resources :meetings
    end
  end
  resources :users do
    scope module: :users do 
      resources :clubs, only: %w[index destroy]
      resources :memberships, only: %w[index destroy]
      resources :recommendations
      resources :meetings, only: %w[index]
    end
  end

  get 'book_search', to: 'book_search#show'



  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
