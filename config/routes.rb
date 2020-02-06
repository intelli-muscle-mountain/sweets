Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
# 　root 'items#top'
  get 'about' => 'items#about'
  resources :items, only: [:index,:show]
  resources :cartitems, only: [:index,:create,:update,:destroy]
  delete 'cartitems/destroy_all' => 'cartitems#destroy_all'

  resources :orders, only: [:new,:index,:create,:show]
  get 'orders/confirm' => 'orders#confirm'
  get 'orders/thanks' => 'orders#thanks'

  resources :addresses, only: [:index,:create,:edit,:update,:destroy]


  namespace :admins do

  	get 'admins/top' => 'admins#top'
  	resources :items, only: [:index,:show,:new,:create,:edit,:update]
  	resources :genres, only: [:index,:edit,:update,:create]
  	resources :customers, only: [:index,:show,:edit,:update]
	resources :orders, only: [:index,:show,:update]
  end

   devise_for :admins, controllers: {
      sessions: 'admins/sessions',
      registrations: 'admins/registrations',
      passwords: 'admins/passwords'
    }

  scope module: 'customers' do
    devise_for :customers, controllers: {
      sessions: 'customers/sessions',
      registrations: 'customers/registrations',
      passwords: 'customers/passwords'
    }
  end
  resources :customers, only: [:show,:edot,:update]
  get 'customers/:id/withdraw' => 'customers#withdraw'
  patch 'customers/:id/withdraw' => 'customers#status_change'
end
