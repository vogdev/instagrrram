class Post < ApplicationRecord
	mount_uploader :picture, PictureUploader
	acts_as_votable
	has_many :comments, dependent: :destroy
	belongs_to :user
	scope :followingAndCurrentUserPosts, ->(current_user) {where(user_id: current_user.following).or(where(user_id: current_user)).order('created_at DESC')}
end
