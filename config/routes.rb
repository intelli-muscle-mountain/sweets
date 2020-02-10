Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  root 'items#index'
  get 'about' => 'items#about'
  get 'admins/top' => 'admins#top'
  resources :items, only: [:index,:show]
  resources :cartitems, only: [:index,:create,:update,:destroy] do
    collection do
      delete :destroy_all
    end
  end

  resources :orders, only: [:new,:index,:create,:show]do
    member do
      get :confirm
      get :thanks
    end
  end

  resources :addresses, only: [:index,:create,:edit,:update,:destroy]

  namespace :admins do
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
  resources :customers, only: [:show,:edit,:update] do
    member do
      get :withdraw
      patch 'withdraw' => 'customers#status_change'
    end
  end
end
