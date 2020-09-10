Rails.application.routes.draw do
  resources :books do
    get "search", to: "books#search"
  end

  resources :clubs
  scope 'users/:id' do
    resources :clubs, only: :index
  end
  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
