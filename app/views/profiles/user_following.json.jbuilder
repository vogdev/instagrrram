json.array! @user_following do |followed|
	json.username followed.username
	json.img followed.avatar.thumbnail.url
	json.profile_url profile_path(followed.id)
end