Rails.application.routes.draw do
  devise_for :users
  root to: 'designs#index'

  resources :designs
  resources :designs do
    collection do
      get  '/search',  to: 'designs#create'
    end
  end

  resources :users
  resources :users, only: :show
  post '/designs/new', to: 'designs#create'
end

