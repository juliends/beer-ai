Rails.application.routes.draw do
  root to: 'pages#home'

  resources :batches, only: :show

  resources :deliveries
end
