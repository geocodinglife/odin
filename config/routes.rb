Rails.application.routes.draw do
  devise_for :users
  resources :leads
  resources :products
  resources :categories
  root 'welcome#index'
end
