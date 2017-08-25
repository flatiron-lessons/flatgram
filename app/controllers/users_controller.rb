class UsersController < ApplicationController
	before_action :authentication_required, only: [:show, :index, :edit, :destroy]

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			session[:user_id] = @user.id
			redirect_to @user
		else
			render :new
			flash[:message] = "Error, please try again."
		end
	end

	def show
		@user = User.find(params[:id])
		@like = Like.new
	end

	def index
		@users = User.all
		if params[:search]
	    @users = User.search(params[:search]).order("created_at DESC")
	  else
	    @users = User.all.order("created_at DESC")
	  end
	end

	def edit
		@user = User.find_by(id: params[:id])
	end

	def update
		@user = User.find_by(id: params[:id])
		@user.email = params[:user][:email]
		@user.username = params[:user][:username]
		if @user.save
			redirect_to user_path @user
		else
			render :edit
			flash[:message] = "There was a problem with edit at this time. We may already be working on this issue, but just in case, please shoot us an email: sitemaintenance@jm.com."
		end		
	end

	def destroy
		@user = User.find_by(id: params[:id])
		@clear_pics = Picture.all.select{|pic| pic.user_id == @user.id}
		@clear_pics.each{ |pic| pic.delete }
		@user.delete
		redirect_to '/logout'
	end


	private

	def user_params
		params.require(:user).permit(:email, :username, :password, :password_confirmation)
	end
end