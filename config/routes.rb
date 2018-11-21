Rails.application.routes.draw do
  root to: 'toppages#index'
  
  get 'login' => 'sessions#new'
  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'
  
  get 'signup' => 'users#new'
  resources :users, only: [:index, :show, :new, :create] do
    ##フォロー/フォロワー一覧表示のためのURL生成##
    member do
      get :followings
      get :followers
    end
  end
  
  resources :microposts, only: [:create, :destroy]
  resources :relationships, only: [:create, :destroy]
end
