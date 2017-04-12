json.array! @user_followers do |follower|
	json.username follower.username
	json.img follower.user_image.url(:thumb)
	json.profile_url profile_path(follower.id)
end