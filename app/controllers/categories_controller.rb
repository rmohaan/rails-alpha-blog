class CategoriesController < ApplicationController
	before_action :require_admin, except: [:index, :show]
	before_action :set_category, only: [ :show, :edit, :update ]

	def index
		@categories = Category.paginate(page: params[:page], per_page: 5)
	end

	def show
		@category = Category.find(params[:id])
		@articles = @category.articles.paginate(page: params[:page], per_page: 5)
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

	def edit
	end

	def update
		respond_to do |format|
      if @category.update(category_params)
        flash[:notice] = "Category was successfully updated."
        flash[:success] = true 
        format.html { redirect_to category_url(@category)  } 
        format.json { render :show, status: :ok, location: @article }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
	end

	private
	def set_category
		@category = Category.find(params[:id])
	end
	
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