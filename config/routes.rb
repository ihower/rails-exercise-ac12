Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :products

  resource :cart do
    member do
      post :add_product
      post :remove_product
    end
  end

  root "products#index"

end
