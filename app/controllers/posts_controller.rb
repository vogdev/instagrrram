class PostsController < ApplicationController
	before_action :authenticate_user!
	before_action :set_post, only: [:show, :edit, :update, :destroy, :like, :unlike]
	before_action :set_post_owner, only: [:edit, :update, :destroy]
	def index
		@posts = Post.followingAndCurrentUserPosts(current_user).page(params[:page])
	end
	def show  
	end 
	def new
		@post = current_user.posts.build
	end
	def create  
	 @post = current_user.posts.build(post_params)
		if @post.save
			flash[:success] = "Post created"
			redirect_to profile_path(current_user)
			else
			flash.now[:alert] = "something went wrong."
			redirect_back(fallback_location: :root_path)
		end
	end  
	def edit
	end
	def update
		if @post.update(post_params)
			flash[:success] = "Post updated"
			redirect_to(post_path(@post))
		else
			flash.now[:alert] = "something went wrong."
			render :edit
		end
	end
	def destroy
		@post.destroy
		redirect_back(fallback_location: :back)
	end
	def like
		@post.liked_by current_user
	end
	def unlike
	 @post.unliked_by current_user
	end

	private
	def post_params
	params.require(:post).permit(:caption, :image)
	end
	def set_post
		@post = Post.find(params[:id])
	end
	def set_post_owner  
    unless current_user == @post.user
     flash[:alert] = "NOOOOOP!!!!"
     redirect_to root_path
    end
  end  

end
