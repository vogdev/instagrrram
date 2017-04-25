class User < ApplicationRecord
	mount_uploader :avatar, AvatarUploader
	#searchkick word_start: [:username, :email]
	acts_as_voter
	validates :username, presence: true, length: { minimum: 4, maximum: 16 }
	devise :database_authenticatable, :registerable,
	       :recoverable, :rememberable, :trackable, :validatable
	has_many :posts, dependent: :destroy  
	has_many :active_relationships,  class_name:  "Relationship", foreign_key: "follower_id", dependent:   :destroy
	has_many :passive_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent:   :destroy
	has_many :following, through: :active_relationships,  source: :followed
	has_many :followers, through: :passive_relationships, source: :follower
	
	# def search_data
	# 	{
	# 		username: username,
	# 		email: email
	# 	}
	# end
	 scope :users_to_follow, -> (current_user){ where.not(id: [[current_user.id] + current_user.following.ids]).first(10) }
	def follow(other)
		active_relationships.create(followed_id: other.id)		
	end
	def unfollow(other)
		active_relationships.find_by(followed_id: other.id).destroy
	end
	def following?(other)
		 following.include?(other)
	end
end
