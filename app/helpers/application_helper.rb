module ApplicationHelper
  def logged_user
    @logged_user ||= User.find(session[:user_id]) if session[:user_id]
	end

	def logged_in?
		p logged_user()
		!!logged_user
	end
end
