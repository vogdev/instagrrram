json.array! @users do |user|
	json.username user.username
	json.img user.avatar.thumbnail.url
	json.profile_url profile_path(user.id)
end