Rails.application.routes.draw do
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  resources :products
  resources :orders, only: %i[new create show]

  namespace :admin do
    resources :orders, only: [:index]
  end
end
