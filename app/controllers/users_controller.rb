class UsersController < ApplicationController
  before_action :set_user, only: [:update, :edit, :show]
	
	# GET /articles or /articles.json
  def index
    @users = User.paginate(page: params[:page], per_page: 3)
  end

	def new
    @user = User.new
  end

	# POST /users or /users.json
	def create
		@user = User.new(user_params)
		@notice = "User creation is successful, welcome #{@user.username}"

		respond_to do |format|
			if @user.save
				session[:user_id] = @user.id
				format.html { redirect_to articles_path, notice: @notice  }
				format.json { render :show, status: :created, location: @article }
			else
				format.html { render :new, status: :unprocessable_entity }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end

	def edit
	end

	# PATCH/PUT /users/1 or /users/1.json
	def update
		respond_to do |format|
			if @user.update(user_params)
				format.html { redirect_to user_path, notice: "User was successfully updated." } 
				format.json { render :show, status: :ok, location: @article }
			else
				format.html { render :edit, status: :unprocessable_entity }
				format.json { render json: @user.errors, status: :unprocessable_entity }
			end
		end
	end
	
	def show
		@articles = @user.articles.paginate(page: params[:page], per_page: 5)
	end

	private
	def user_params
		params.require(:user).permit(:username, :email, :password)
	end

	def set_user
		@user = User.find(params[:id])
	end

end