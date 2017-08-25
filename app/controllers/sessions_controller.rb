class SessionsController < ApplicationController

	def new
		if logged_in?
			redirect_to user_path(session[:user_id])
		end
	end

	def create
		@user = User.find_by(email: params[:email])
		if @user && @user.authenticate(params[:password])		
			session[:user_id] = @user.id
			redirect_to "/users/#{@user.id}"
		else
			redirect_to login_path
		end
	end

	def destroy
  	session.delete :user_id
  	redirect_to root_path
	end
end