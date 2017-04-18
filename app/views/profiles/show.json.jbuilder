json.profile_user do
	json.(@user, :username, :avatar)
	json.posts_num @profilePosts.count
	json.followers @user.followers.count
	json.following @user.following.count
end
json.current_user do
	if current_user == @user
		json.post_owner true
	else
		json.post_owner false
	end
	if current_user.id != @user.id
		if !current_user.following?(@user)
			json.following_this_user false
		else
			json.following_this_user true
		end
	end
end
json.Posts @profilePosts do |profilePost|
	json.id profilePost.id
	json.image profilePost.image.url(:original)
end