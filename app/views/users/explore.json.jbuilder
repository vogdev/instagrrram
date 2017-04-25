json.array! @users_to_follow do |user|
	json.id user.id
	json.username user.username
	json.img user.avatar.thumbnail.url
	json.profile_url profile_path(user.id)
	json.user_posts user.posts.last(3) do |post|
				json.picture post.picture.url(quality: "auto", height: 185, crop: "scale") 
	end
end