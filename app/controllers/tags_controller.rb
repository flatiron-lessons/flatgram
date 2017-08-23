class TagsController < ApplicationController
	before_action :authentication_required

	def new
		@tag = Tag.new
	end

	def create
		authentication_required
		@tag = Tag.create(tag_params)

		if @tag.save
			redirect_to tags_path
		else
			render :new
		end
	end

	def show
		authentication_required
		@tag = Tag.find(params[:id])
	end

	def index
		@tags = Tag.all
	end

	private

	def tag_params
		params.require(:tag).permit(:name)
	end
end