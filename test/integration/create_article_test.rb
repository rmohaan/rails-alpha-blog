require 'test_helper'

class CreateArticleTest < ActionDispatch::IntegrationTest
  setup do
    @user = User.new(username: "admin", email: "admin@admin.com", password: "password", admin: true)
    @user.save
    sign_in_as(@user)
  end

  test "create new article" do
      @article = Article.new(title: "Unique new Article title", description: "article description", genre: "Test", user: @user)

      assert_difference 'Article.count', 1 do
        post articles_path, params: { article: { title: @article.title, description: @article.description, genre: @article.genre, user_id: @article.user_id } }
        assert_response :redirect
      end

      follow_redirect!
      assert_match "Unique", response.body
  end
end
