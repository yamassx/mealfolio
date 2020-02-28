Rails.application.routes.draw do
  root  "portfolios#lp"
  devise_for :restaurants, controllers: {
    sessions:      'restaurants/sessions',
    passwords:     'restaurants/passwords',
    registrations: 'restaurants/registrations'
  }
  devise_for :cooks, controllers: {
    sessions:      'cooks/sessions',
    passwords:     'cooks/passwords',
    registrations: 'cooks/registrations'
  }
  resources :cooks, only: [:edit, :update, :index]
  resources :portfolios
end
