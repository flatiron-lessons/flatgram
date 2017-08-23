class UsersController < ApplicationController
	before_action :authentication_required
	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to @user
		else
			render :new
			# flash[:message] = ""
		end
	end

	def show
		authentication_required
		@user = User.find(params[:id])
	end

	def index
		@users = User.all
	end

	private

	def user_params
		params.require(:user).permit(:email, :username, :password, :password_confirmation)
	end
end