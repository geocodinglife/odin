Rails.application.routes.draw do
  resource :events
  get "pagos/respuesta"
  get "sessions/new"
  get "sessions/create"
  get "sessions/destroy"
  root "welcome#index"

  resources :users
  resources :leads
  resources :products
  resources :categories

  post "add/user", to: "rooms#add_user"

  resource :auth, only: %i[show create destroy], controller: :auth do
    member do
      get "new_account", action: "new_account"
    end
  end

  resource :auth_verifications, only: %i[show create]
  resources :sessions, only: [:new, :create, :destroy]

  resources :rooms do
    resources :messages
  end
end
