class CategoriesController < ApplicationController
	before_action :require_admin, except: [:index, :show]

	def index
		@categories = Category.paginate(page: params[:page], per_page: 5)
	end

	def show
		@category = Category.find(params[:id])
	end

	def new
		@category = Category.new
	end

	def create
		@category = Category.new(category_params)

		if @category.save
			flash[:notice] = "Category created successfully"
			flash[:success] = true
			redirect_to @category
		else
			render :new
		end
	
	end

	private
	def category_params
		params.require(:category).permit(:name)
	end

	def require_admin
		if !(logged_in? && logged_user.admin?)
			flash[:notice] = "Only admins are allowed to perform that action"
			flash[:success] = false
			redirect_to categories_path
		end
	end

end