module ApplicationHelper
	def alert_for(flash_type)  
		{ 
			success: 'alert-success',
			error: 'alert-danger',
			alert: 'alert-warning',
			notice: 'alert-info'
		}[flash_type.to_sym] || flash_type.to_s
	end  
	def user_nav_avatar
		if  current_user.avatar.present?
              cl_image_tag(current_user.avatar, height: 40, crop: "scale", class: "img-circle")
            else
              image_tag("https://res.cloudinary.com/deqorjmzl/image/upload/v1493725024/default_jjteoi.png", height: 40, crop: "scale", class: "img-circle")
         end
	end
end
