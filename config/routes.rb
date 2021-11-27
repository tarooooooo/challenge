Rails.application.routes.draw do
  get 'relationships/followings'
  get 'relationships/followers'
  get 'homes/top'
  get 'homes/about'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get '/', to: 'homes#top', as: 'root'
  get '/about', to: 'homes#about'
  get  '/signup',  to: 'users#new'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  resources :users do
    resource :relationships, only: [:create, :destroy]
    get 'followings' => 'relationships#followings', as: 'followings'
    get 'followers' => 'relationships#followers', as: 'followers'
    collection do
      get :search
    end
  end
  resources :rooms, only: [:show] do
    member do
      get :join
    end
  end
  resources :posts do
    resource :like, only: [:create, :destroy]
    resources :rooms, only: [:create]
  end
  
  resources :messages, only: [:create, :destroy]
end
