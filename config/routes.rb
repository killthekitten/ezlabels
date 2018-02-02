Rails.application.routes.draw do
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
