class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	acts_as_votable
	belongs_to :user
	validates :image, presence: true
	has_attached_file :image, styles: { original: "600x600>", thumb: "300x300>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
	scope :followingAndCurrentUserPosts, ->(current_user) {where(user_id: current_user.following).or(Post.where(user_id: current_user)).order('created_at DESC')}
end
