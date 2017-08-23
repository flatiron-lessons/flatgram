# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [1,2,3,4,5,6,7,8,9,10]
tags = ["Fall", "winter", "summer", "spring", "NYC", "nature"]
url = "http://www.defenders.org/sites/default/files/styles/large/public/dolphin-kristian-sekulic-isp.jpg"

users.each do |num|
	User.create(
		username: "user#{num}",
		email: "user#{num}@flatiron-gram.com",
		password: "#{num}23",
		password_confirmation: "#{num}23"
		)
end


tags.each do |tag|
	Tag.create(
		name: tag
		)
end


Picture.create(
	image_url: "http://image.nj.com/home/njo-media/width620/img/ledgerupdates_impact/photo/2017/07/30/solar-eclipse-90c6f8d61484af0e.jpg",
	title: "Solar Eclipse!",
	user_id: User.first.id
	)