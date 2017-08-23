class LikesController < ApplicationController

	def new
		@like = Like.new
	end

	def create
		@like = Like.create(like_params)
		if @like.save
			redirect_back fallback_location: root_path
			# flash[message] if it didnt save
		end
	end

	def destroy
		Like.find_by(user_id: params[:like][:user_id], picture_id: params[:like][:picture_id]).delete
		redirect_back fallback_location: root_path
	end

	private

	def like_params
		params.require(:like).permit(:user_id, :picture_id)
	end
end