Rails.application.routes.draw do


  resources :badges, only: :index
  get 'achievements', to: 'badges#achievements'
  resources :feedbacks, only: %i[new create]
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
      patch :update_inline, on: :member
      resources :questions, shallow: true, except: :index do
        resources :answers, shallow: true ,except: :index
      end
    end
    resources :gists, only: :index
    resources :badges, shallow: true
  end
end
