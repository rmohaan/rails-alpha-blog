ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
  def sign_in_as(user)
    post login_path, params: { session: {username: user.username, password: "password"}}
  end

  def logged_user
    @logged_user ||= User.find(session[:user_id]) if session[:user_id]
  end
  
  def logged_in?
    !!logged_user
  end
  
  def require_user
    if !logged_in?
      flash[:danger] = "You must be logged in to perform that action!"
      redirect_to root_path
    end
  end

end
