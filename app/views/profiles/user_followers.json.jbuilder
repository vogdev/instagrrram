json.array! @user_followers do |follower|
	json.username follower.username
	json.img follower.avatar.thumbnail.url
	json.profile_url profile_path(follower.id)
end