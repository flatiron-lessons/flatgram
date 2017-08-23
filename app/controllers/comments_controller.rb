class CommentsController < ApplicationController
	before_action :authentication_required

	def new
		@comment = Comment.new
	end

	def create
		authentication_required
		@comment = Comment.create(comment_params)
		@comment.user = User.find_by(id: session[:user_id])

		if @comment.save
			redirect_to "/pictures/#{@comment.picture.id}"
		else
			render :new
		end
	end

	def show
		authentication_required
		@comment = Comment.find(params[:id])
	end

	def update
		byebug
	end

	def destroy
		@comment = Comment.find(params[:id]).delete
		redirect_to "/pictures/#{@comment.picture.id}"
	end

	private

	def comment_params
		params.require(:comment).permit(:content, :picture_id)
	end

end
