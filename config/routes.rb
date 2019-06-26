Rails.application.routes.draw do
  root to: 'batches#show'

  resources :batches, only: :show
  resources :batch_products, path: :bp, only: [:new, :create] do
    resources :deliveries, only: :create
  end
end
