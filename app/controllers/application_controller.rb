class ApplicationController < ActionController::Base

		helper_method :logged_user, :logged_in?

    def logged_user
      @logged_user ||= User.find(session[:user_id]) if session[:user_id]
    end

		def logged_in?
			!!logged_user
		end

		def require_user
			if !logged_in?
				flash[:notice] = "You should be logged in to perform this action"
				redirect_to login_path
			end
		end
end
