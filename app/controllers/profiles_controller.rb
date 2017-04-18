class ProfilesController < ApplicationController
	# before_action :authenticate_user!
	def show  
	  @profilePosts = User.find_by(id: params[:id]).posts.order('created_at DESC').page(params[:page])
	  @user = User.find_by(id: params[:id])
	end  
	def user_followers
		@user = User.find_by(id: params[:id])
		@user_followers = @user.followers
	end
	def user_following
		@user = User.find_by(id: params[:id])
		@user_following = @user.following
	end
end
