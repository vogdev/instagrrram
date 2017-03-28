class ProfilesController < ApplicationController
	def show  
	  @profilePosts = User.find_by(id: params[:id]).posts.order('created_at DESC').page(params[:page])
	  @user = User.find_by(id: params[:id])
	end  
end
