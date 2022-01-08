Rails.application.routes.draw do
  root 'homes#top'
  devise_for :customers
  resources :recepis, only: %i[new index show edit update create destroy] do
    resources :recepi_comments, only: %i[create destroy]
  end
  resources :customers, only: %i[new index show edit update] do
    get 'my_recepi', on: :member
  end

end