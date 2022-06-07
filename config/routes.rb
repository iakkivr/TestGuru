Rails.application.routes.draw do
  root 'pages#index'
  resources :tests do
    resources :questions, shallow: true, except:  [:index]
  end

end
