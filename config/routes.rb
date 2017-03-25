Rails.application.routes.draw do
  devise_for :users
  root 'posts#index'
  resources :posts do 
  	resources :comments
  	member do
  		put "like" => 'posts#like'
  		put "unlike" => 'posts#unlike'
  	end
  end
end
