Rails.application.routes.draw do
  scope "users/:id" do
    resources :books
  end

  scope "books" do
    get "search", to: "books#search"
  end

  devise_for :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
