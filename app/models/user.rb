class User < ApplicationRecord
searchkick word_start: [:username, :email]
	acts_as_voter
	validates :username, presence: true, length: { minimum: 4, maximum: 16 }
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
	has_many :posts, dependent: :destroy  
	has_many :active_relationships,  class_name:  "Relationship", foreign_key: "follower_id", dependent:   :destroy
	has_many :passive_relationships, class_name:  "Relationship", foreign_key: "followed_id", dependent:   :destroy
	has_many :following, through: :active_relationships,  source: :followed
	has_many :followers, through: :passive_relationships, source: :follower
	
	has_attached_file :user_image, styles: { original: "300x300>", thumb: "150x150>" }, :default_url => ActionController::Base.helpers.asset_path('UserMissing_:style.png')
	validates_attachment_content_type :user_image, content_type: /\Aimage\/.*\z/
	
	def search_data
		{
			username: username,
			email: email
		}
	end
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
