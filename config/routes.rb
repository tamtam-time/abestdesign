Rails.application.routes.draw do
  devise_for :users
  root to: 'designs#index'
<<<<<<< HEAD

=======
  resources :users
>>>>>>> 2e94406f4bf121437d7c427e129828a1736318f7
  resources :designs
  resources :designs do
    collection do
      get 'search'
    end
  end

  resources :users
  resources :users, only: :show
  post '/designs/new', to: 'designs#create'
end

