Rails.application.routes.draw do
  root 'posts#index'
  get 'user/:id/followers', to: 'profiles#user_followers', as: :followers
  get 'user/:id/following', to: 'profiles#user_following', as: :following
  get 'user/:id/show', to: 'profiles#show', as: :profile  
  get 'explore' => 'users#explore'
  resources :relationships, only:[:create, :destroy]do
  delete 'unfollow' => "relationships#unfollow"
end
  devise_for :users
    resources :users, only:[:following, :followers] do
      member do
        get :following, :followers
      end
      collection do
          get 'search' => "users#search"
          get 'explore' => "users#explore"
      end
    end
  resources :posts do 
    resources :comments
    member do
        put "like" => 'posts#like'
            put "unlike" => 'posts#unlike'
  	end
  end
end
