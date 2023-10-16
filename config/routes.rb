Rails.application.routes.draw do
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  root "welcome#index"

  resources :users
  resources :leads
  resources :products
  resources :categories

  post "add/user", to: "rooms#add_user"

  resource :auth, only: %i[show create destroy], controller: :auth
  resource :auth_verifications, only: %i[show create]
  resources :sessions, only: [:new, :create, :destroy]
  resources :rooms do
    resources :messages
  end
end
