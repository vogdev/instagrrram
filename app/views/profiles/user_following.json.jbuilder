json.array! @user_following do |followed|
	json.username followed.username
	json.img followed.user_image.url(:thumb)
	json.profile_url profile_path(followed.id)
end