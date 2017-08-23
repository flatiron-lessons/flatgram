class PicturesController < ApplicationController
	before_action :authentication_required, only: [:create, :show]

	def new
		@picture = Picture.new
	end

	def create
		@picture = Picture.create(picture_params)
		@user = User.find(session[:user_id])
		@picture.user = @user

		if params[:picture][:tag]
			@picture.tags << Tag.create(name: params[:picture][:tag][:name])
		end

		if @picture.save
			redirect_to @picture
		else
			render :new
		end
	end

	def show
		@comment = Comment.new
		@picture = Picture.find(params[:id])
	end

	def index
		@pictures = Picture.all
	end

	def destroy
		Picture.find(params[:id]).delete
		redirect_to user_path("#{current_user.id}")
	end

	private

	def picture_params
		params.require(:picture).permit(:image_url, :title, tag_ids: [])
	end
end