Rails.application.routes.draw do
  resources :messages
  resources :rooms
  devise_for :users
  resources :leads
  resources :products
  resources :categories
  root 'welcome#index'
end
