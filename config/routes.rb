Rails.application.routes.draw do
  root "cooks#index"
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
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
