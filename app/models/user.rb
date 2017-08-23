class User < ActiveRecord::Base

	validates :email, uniqueness: true
	validates :username, uniqueness: true
	has_secure_password

	has_many :likes
	has_many :pictures
	has_many :comments
	has_many :picture_tags, through: :pictures
	has_many :tags, through: :picture_tags
	
	def received_comments
		# shows all comments made on self.pictures

		# map all comments into an array
		self.pictures.each do |pic|
			pic.comments.each do |c|
				c.user.username
				# does a comment have content? at the moment - no.
			end
		end
	end

	# james.like(user_id: self.id, picture_id: 5)
	def liked?(picture)
		self.likes.find_by(user_id: self.id, picture_id: picture.id).present?
	end
end