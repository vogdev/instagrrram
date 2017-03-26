Rails.application.routes.draw do
	get ':id', to: 'profiles#show', as: :profile  
resources :relationships
  devise_for :users
  	resources :users, only:[:following, :followers] do
  		member do
  			get :following, :followers
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
