Rails.application.routes.draw do
  root 'pages#index'
  resources :tests do
    resources :questions, only: [:new, :create]
  end

  resources :questions, only: [:show, :edit, :update, :destroy]
end
