Rails.application.routes.draw do
  root to: 'batches#show'

  resources :batches, only: :show
  resources :batch_product, path: :bp, only: [] do
    resources :deliveries, only: :create
  end
end
