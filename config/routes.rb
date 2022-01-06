Rails.application.routes.draw do
  root 'homes#top'
  devise_for :customers
  resources :recepis, only: %i[new index show edit update create destroy]
  resources :customers, only: %i[new index show edit update]

end