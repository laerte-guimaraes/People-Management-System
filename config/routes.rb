Rails.application.routes.draw do
  root to: 'home#index'

  resources :employee

  resources :department
end
