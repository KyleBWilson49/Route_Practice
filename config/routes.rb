Rails.application.routes.draw do
  resources :users, only: [:index, :show, :create, :update, :destroy] do
    resources :contacts, only: [:index]
    resources :comments, only: [:index, :show, :create, :update, :destroy]
  end

  resources :contacts, only: [:show, :create, :update, :destroy] do
    resources :comments, only: [:index, :show, :create, :update, :destroy]
  end
  resources :contact_shares, only: [:create, :destroy]
end
