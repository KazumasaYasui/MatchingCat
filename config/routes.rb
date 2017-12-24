Rails.application.routes.draw do
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    registrations: 'users/registrations',
    passwords: 'users/passwords'
  }
  resources :users, only:[:index, :show] do
    get 'my_cat', on: :member
    get 'my_article', on: :member
    get 'my_event', on: :member
    get 'my_post', on: :member
    get 'cat_history', on: :member
    get 'event_history', on: :member
    get 'my_favorite', on: :member
  end
  # resources :categories, only:[:index, :show]
  resources :articles
  resources :cats do
    resource :favorites, only:[:create, :destroy]
  end
  resources :events
  resources :posts
  post 'create_order', to: 'orders#create_order'
  get 'view_order', to: 'orders#view_order'
  patch 'complete_order', to: 'orders#complete_order'
  post 'create_reservation', to: 'reservations#create_reservation'
  get 'view_reservation', to: 'reservations#view_reservation'
  patch 'complete_reservation', to: 'reservations#complete_reservation'
  root to: 'home#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
