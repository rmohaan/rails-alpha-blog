require 'test_helper'
require 'selenium-webdriver'

class CategoryTest < ActiveSupport::TestCase

	def setup
		@category = Category.new(name: "Lifestyle") 
	end

	test "verify category is valid" do
		assert @category.valid?
	end

	test "name should be present" do
		@category.name = " "
		assert_not @category.valid?
	end

	test "name should be unique" do
		@category.save
		@category2 = Category.new(name: "Lifestyle")
		assert_not @category2.valid?
	end

	test "name should not more than 25 chars" do
		@category.name = "12345678901234567890123456"
		assert_not @category.valid?
	end

	test "name should not less than 3 chars" do
		@category.name = "12"
		assert_not @category.valid?
	end

end