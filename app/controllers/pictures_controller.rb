class PicturesController < ApplicationController
	before_action :authentication_required

	def new
		@picture = Picture.new
	end

	def create
		authentication_required
		@picture = Picture.create(picture_params)
		@user = User.find(session[:user_id])
		@picture.user = @user
		@picture.tags << Tag.create(name: params[:tag][:name])

		if @picture.save
			redirect_to @picture
		else
			render :new
		end
	end

	def show
		authentication_required
		@picture = Picture.find(params[:id])
	end

	def index
		@pictures = Picture.all
	end

	def destroy
		Picture.find(params[:id]).delete
		render "users/#{session[:user_id]}"
	end

	private

	def picture_params
		params.require(:picture).permit(:image_url, :title, tag_ids: [])
	end
end