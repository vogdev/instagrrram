module ProfilesHelper
	def user_profile_avatar(user)
		if  user.avatar.present?
             cl_image_tag(user.avatar, alt: "img" ,quality: "auto",  class:'img-circle user-profile-img')
            else
              image_tag("https://res.cloudinary.com/deqorjmzl/image/upload/v1493725024/default_jjteoi.png", class: "img-circle user-profile-img")
         end
	end
end
