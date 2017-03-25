class CommentsController < ApplicationController
	before_action :set_post
	def create  
	  comment = @post.comments.build(comment_params)
	  comment.user_id = current_user.id
	  if comment.save
	  		redirect_back(fallback_location: :back)
	  else
	    flash[:alert] = "Something went wrong"
	    render root_path
	  end
	end
	def destroy  
		if current_user == @post.comments.first.user
	  		comment = @post.comments.find(params[:id])
	  		comment.destroy
	  		redirect_back(fallback_location: root_path)
	  	else
	  		flash[:alert] = "NOOOOOP!!!!"
     		redirect_to root_path
		end  
	end  
	private
	def comment_params  
	  params.require(:comment).permit(:content)
	end
	def set_post  
	  @post = Post.find(params[:post_id])
	end  
end
