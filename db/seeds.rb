# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = [1,2,3,4,5,6,7,8,9,10]

users.each do |num|
	User.create(
		username: "user#{num}",
		email: "user#{num}@flatiron-gram.com",
		password: "#{num}23",
		password_confirmation: "#{num}23"
		)
end

Picture.create(
	image_url: "http://ghk.h-cdn.co/assets/16/09/980x490/landscape-1457107485-gettyimages-512366437.jpg",
	title: "Puppy",
	user_id: User.second.id
	)

Picture.create(
	image_url: "https://cdn-image.realsimple.com/sites/default/files/styles/rs_horizontal_image_4/public/puppy-running.jpg?itok=KFryFqUj",
	title: "Puppy",
	user_id: User.last.id
	)

Picture.create(
	image_url: "http://cdn.akc.org/content/hero/header(1).jpg",
	title: "Puppy",
	user_id: User.first.id
	)

Picture.create(
	image_url: "https://i.pinimg.com/736x/8a/9d/85/8a9d85afc3587ec126082715a0b55a5c--happy-puppy-puppy-love.jpg",
	title: "Puppy",
	user_id: User.third.id
	)