Rails.application.routes.draw do
  root "cooks#index"
  devise_for :reataurants, controllers: {
    sessions:      'reataurants/sessions',
    passwords:     'reataurants/passwords',
    registrations: 'reataurants/registrations'
  }
  devise_for :cooks, controllers: {
    sessions:      'cooks/sessions',
    passwords:     'cooks/passwords',
    registrations: 'cooks/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
