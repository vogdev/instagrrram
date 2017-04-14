Rails.application.routes.draw do
  get 'user/:id/followers', to: 'profiles#user_followers', as: :followers
  get 'user/:id/following', to: 'profiles#user_following', as: :following
  get 'user/:id/show', to: 'profiles#show', as: :profile  
resources :relationships
  devise_for :users
  	resources :users, only:[:following, :followers] do
  		member do
  			get :following, :followers
  		end
            collection do
                get 'search' => "users#search"
            end
  	end
  root 'posts#index'
  resources :posts do 
  	resources :comments
  	member do
  		put "like" => 'posts#like'
            put "unlike" => 'posts#unlike'
  	end
  end
end
