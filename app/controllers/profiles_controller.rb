class ProfilesController < ApplicationController
	def show  
	  @posts = User.find_by(id: params[:id]).posts.order('created_at DESC')
	  @user = User.find_by(id: params[:id])
	end  
end
