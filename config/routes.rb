Rails.application.routes.draw do

  mount ActionCable.server => "/cable"

  devise_for :users

  resources :rooms do
    resources :messages
  end

  resources :cats do
    collection do
      get :vue
      get :v2
    end
  end

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
