class Post < ApplicationRecord
	acts_as_votable
	belongs_to :user
	validates :image, presence: true
	has_attached_file :image, styles: { original: "600x600>", thumb: "300x300>" }, default_url: "/images/:style/missing.png"
	validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
end
