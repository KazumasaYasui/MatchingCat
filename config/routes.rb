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
  end
  # resources :categories, only:[:index, :show]
  resources :articles
  resources :events
  resources :cats
  root to: 'cats#index'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
