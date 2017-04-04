json.array! @posts do |post|
	json.post_id post.id
	json.post_user_profile profile_path(post.user.id)
	json.post_owner_image post.user.user_image.url(:thumb)
	json.owner_profile_url profile_path(post.user.id)
	json.post_username post.user.username
	json.post_time_ago time_ago_in_words(post.created_at).gsub('about','')
	json.post_image post.image.url(:original)
	json.post_likes post.get_upvotes.size
	if current_user.voted_up_on? post
		json.voted true
	else
		json.voted false
	end
	if post.comments
		json.comments post.comments.last(4) do |comment|
			json.comment_id comment.id
			json.comment_content comment.content
			json.comment_username comment.user.username
				if comment.user == current_user
					json.link_to_delete post_comment_path(post, comment)
				end
		end
	end
end