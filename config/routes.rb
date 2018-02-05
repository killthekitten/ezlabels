Rails.application.routes.draw do
  devise_for :users
  root to: 'projects#index'

  resources :projects, except: [:destroy] do
    get :next_picture, to: 'pictures#next'
    resources :pictures, only: [:show] do
      member do
        patch :inspect
      end
    end
  end

end
