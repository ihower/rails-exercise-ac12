Rails.application.routes.draw do

  post 'pay2go/return'
  post 'pay2go/notify'

  mount ActionCable.server => "/cable"

  devise_for :users

  resources :rooms do
    get :react, :on => :member
    resources :messages
  end

  resources :cats do
    collection do
      get :vue
      get :v2
    end
  end

  resources :products

  resources :orders do
    member do
       post :checkout_pay2go
    end
  end

  resource :cart do
    member do
      post :add_product
      post :remove_product
    end
  end

  root "products#index"

end
