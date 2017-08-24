class UsersController < ApplicationController
	before_action :authentication_required, only: [:show, :index]

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
			# flash[:message] = ""
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

	private

	def user_params
		params.require(:user).permit(:email, :username, :password, :password_confirmation)
	end
end