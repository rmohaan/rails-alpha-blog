require 'test_helper'

class UserSignUpTest < ActionDispatch::IntegrationTest
  setup do
    @article = Article.create(title: "Test", description: "Test Description of art", genre: "Test")
    @user = User.new(username: "Test1", email: "test@t.com", password: "password")
  end

  test "verify user is able to sign up" do
    get '/signup'
    assert_response :success

    assert_difference "User.count", 1 do
      post users_path, params: { user:  { username: "Test1", email: "test@t.com", password: "password"}  }
      sign_in_as(@user)
      assert_response :redirect
    end
    
    follow_redirect!
    assert_response :success
  end
end
