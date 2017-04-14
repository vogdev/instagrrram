json.array! @users do |user|
	json.username user.username
	json.img user.user_image.url(:thumb)
	json.profile_url profile_path(user.id)
end