Rails.application.routes.draw do
  devise_for :users
  root to: 'designs#index'

  resources :designs
  resources :designs do
    collection do
      get  '/designs/search',  to: 'designs#search'
      post  '/designs/search',  to: 'designs#search'
    end
  end

  resources :users
  resources :users, only: :show
  post '/designs/new', to: 'designs#create'
end

