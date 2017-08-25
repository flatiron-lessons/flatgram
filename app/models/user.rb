class User < ActiveRecord::Base
	validates :email, uniqueness: true
	validates :username, uniqueness: true
	has_secure_password

	has_many :likes
	has_many :pictures
	has_many :comments
	has_many :picture_tags, through: :pictures
	has_many :tags, through: :picture_tags

	has_many :active_relationships, class_name: "Relationship", foreign_key: "follower_id", dependent: :destroy	
	has_many :following, through: :active_relationships, source: :followed

	has_many :passive_relationships, class_name: "Relationship", foreign_key: "followed_id", dependent: :destroy		
	has_many :followers, through: :passive_relationships, source: :follower

	def liked?(picture)
		self.likes.find_by(user_id: self.id, picture_id: picture.id).present?
	end

	def self.search(search)
 	 where("username LIKE ?", "%#{search}%") 
	end

	def follow(user)
		following << user
	end

	def following?(user)
		following.include?(user)
	end

	def unfollow(user)
		following.delete(user)
	end
end