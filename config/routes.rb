Rails.application.routes.draw do
  devise_for :users
  root to: 'designs#index'

  resources :designs do
    collection do
      get 'search'
    end
  end

  resources :users, only: :show
  post '/designs/new', to: 'designs#create'
end

