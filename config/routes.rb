Rails.application.routes.draw do
  devise_for :reataurants
  devise_for :cooks
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
