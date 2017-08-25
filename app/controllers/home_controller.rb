class HomeController < ApplicationController

	def welcome
		@like = Like.new
	end

end