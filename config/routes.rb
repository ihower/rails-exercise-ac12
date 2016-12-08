Rails.application.routes.draw do
  devise_for :users

  resources :cats

  resources :products

  resources :orders

  resource :cart do
    member do
      post :add_product
      post :remove_product
    end
  end

  root "products#index"

end
