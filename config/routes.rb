Rails.application.routes.draw do
  root 'pages#index'
  resources :tests do
    resources :questions, shallow: true
  end
end
