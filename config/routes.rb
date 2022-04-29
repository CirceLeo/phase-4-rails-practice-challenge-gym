Rails.application.routes.draw do
  resources :memberships, only: [:create]
  resources :gyms, only: [:show, :delete]
  resources :clients, only: [:show]
end
