Rails.application.routes.draw do


  root 'pages#index'

  devise_for :users, path: :gurus, path_names: { sign_in: :login, sign_out: :logout}

  resources :tests, only: :index do
    post :start, on: :member
  end

  resources :test_passages, only: %i[show update] do
      get :result, on: :member

      resources :gists, only: :create
  end

  namespace :admin do
    resources :tests do
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true ,except: :index
      end
    end
    resources :gists, only: :index
  end
end
