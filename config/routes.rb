Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: "user_registrations" }
  resources :users

  get 'simple_pages/about'
  get 'simple_pages/contact'
  get 'simple_pages/index'
  post 'simple_pages/thank_you'
  post 'payments/create'
  get 'payments/create'
  get 'payments/purchase'
  mount ActionCable.server => '/cable'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'simple_pages#landing_page'
  resources :orders, only: [:index, :show, :create, :destroy]

  resources :products do
    resources :comments
  end

end
