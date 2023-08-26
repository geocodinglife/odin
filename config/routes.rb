Rails.application.routes.draw do
  resources :products
  devise_for :views
  devise_for :users
  resources :welcome, only: [:index, :show]
  root 'welcome#index'
end
