Rails.application.routes.draw do
  root 'product_types#index'

  get 'static_pages/home'

  get 'static_pages/help'

  get 'static_pages/about'

  get 'static_pages/contact'

  get 'products/allitems'

  resources :products
  resources :product_types
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
