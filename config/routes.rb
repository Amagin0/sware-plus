Rails.application.routes.draw do
  root 'homes#top'
  devise_for :customers
  resources :recepis, only: %i[new index show edit update create destroy] do
    resources :recepi_comments, only: %i[create destroy]
    resources :recepi_raties, only: %i[create]
    resource :favorites, only: %i[create destroy]
  end

  resources :customers, only: %i[new index show edit update] do
    member do
      get 'my_recepi'
      get 'my_favorite'
    end

    collection do
      get 'unsubscribe'
      patch 'deleted'
    end

    resource :relationships, only: %i[create destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
  end

  resources :genres, only: %i[index create destroy]
  get '/search' => 'searches#search'
  get '/rank' => 'ranks#rank'
end
