Rails.application.routes.draw do
  devise_for :users
  root 'welcome#index'

  resources :leads
  resources :products
  resources :categories
  
  post 'add/user', to: 'rooms#add_user'

  resources :rooms do
    resources :messages
  end
end
