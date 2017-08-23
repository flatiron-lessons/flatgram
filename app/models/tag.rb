class Tag < ActiveRecord::Base
	has_many :picture_tags
	has_many :pictures, through: :picture_tags
	validates :name, uniqueness: true

	def self.most_popular
		# returns most popular tags
		Tag.all.sort_by { |tag| tag.pictures.length }.last(3)
	end

	def self.trending
		# tag from last 10 picutres with the most comments
		self.all.last(10).sort_by { |tag| tag.pictures.comments.length }.last
	end
end