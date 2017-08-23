class CommentsController < ApplicationController
	before_action :authentication_required, only: [:create, :show, :edit]

	def new
		@comment = Comment.new
	end

	def create
		@comment = Comment.create(comment_params)
		@comment.user = User.find_by(id: session[:user_id])

		if @comment.save
			redirect_to "/pictures/#{@comment.picture.id}"
		else
			render :new
		end
	end

	def show
		@comment = Comment.find()
	end

	def edit
		@comment = Comment.find(params[:id])
	end

	def update
		@comment = Comment.find(params[:id])
		if @comment.update(comment_params)
			redirect_to picture_path(@comment.picture_id)
		else
			render :new
		end
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
