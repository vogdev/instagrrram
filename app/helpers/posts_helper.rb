module PostsHelper
	def user_explore_avatar(user)
		if  user.avatar.present?
             cl_image_tag(user.avatar, alt: "img" ,quality: "auto", class: "img-circle post-user-img")
            else
              image_tag("https://res.cloudinary.com/deqorjmzl/image/upload/v1493725024/default_jjteoi.png", height: 40, crop: "scale", class: "img-circle")
         end
	end
end
