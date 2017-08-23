class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  helper_method :logged_in?, :current_user

  def current_user
  	if session[:user_id]
  		@current_user ||= User.find(session[:user_id])
  	end
  end

  def authentication_required
		if !logged_in?
	    redirect_to login_path
		end
	end

	def logged_in?
		!!current_user
	end
end
