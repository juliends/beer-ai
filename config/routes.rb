Rails.application.routes.draw do
  root to: 'batches#show'

  resources :batches, only: :show do
    resources :batch_products, only: [:new, :create]
  end
  resources :batch_products, path: :bp, only: [] do
    resources :deliveries, only: :create
  end
end
