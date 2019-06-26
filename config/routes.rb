Rails.application.routes.draw do
  root to: 'batches#show'

  resources :batches, only: :show
end
