Rails.application.routes.draw do

  resources :cocktails, only: [:index, :show, :new, :create] do
    resources :doses, only: [:new, :create, :edit, :update]
  end
  resources :doses, only: [:edit, :update, :destroy]

  root "cocktails#index"
end
