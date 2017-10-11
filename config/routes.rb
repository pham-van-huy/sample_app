Rails.application.routes.draw do
  resources :users

  get  "/signup", to: "users#new"
  root "static_pages#home"
  get  "/help", to: "static_pages#help"
  get  "/about", to: "static_pages#about"
  get  "/contact", to: "static_pages#contact"
  get    "/login",   to: "sessions#new"
  post   "/login",   to: "sessions#create"
  delete "/logout",  to: "sessions#destroy"
  resources :account_activations, only: [:edit]
end
