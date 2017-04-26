class RelationshipsController < ApplicationController
	before_action :authenticate_user!
	def create
		followed_id = params[:followed_id]
		user = User.find(followed_id)
		current_user.follow(user)
		 @relation = current_user.active_relationships.find_by(followed_id: followed_id)
		 render json: @relation.id
	end
	def destroy
		user = Relationship.find(params[:id]).followed
		current_user.unfollow(user)
		redirect_back(fallback_location: root_path)
	end	
	def unfollow
		head(:ok)
		user = Relationship.find(params[:relationship_id]).followed
		current_user.unfollow(user)
	end
end
