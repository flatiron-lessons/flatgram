class PictureTag < ActiveRecord::Base
	belongs_to :tag
	belongs_to :picture
end