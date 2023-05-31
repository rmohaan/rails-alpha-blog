class UsersController < ApplicationController
  # GET /articles or /articles.json
  def index
    @users = User.all
  end

	def new
        @user = User.new
    end

		# POST /users or /users.json
    def create
			# debugger
			@user = User.new(user_params)
			@notice = "User creation is successful, welcome #{@user.username}"

			respond_to do |format|
				if @user.save
						format.html { redirect_to articles_path, notice: @notice  }
						format.json { render :show, status: :created, location: @article }
				else
						format.html { render :new, status: :unprocessable_entity }
						format.json { render json: @user.errors, status: :unprocessable_entity }
				end
			end
    end

		def edit
			@user = User.find(params[:id])
			# debugger
		end

		# PATCH/PUT /users/1 or /users/1.json
		def update
			@user = User.find(params[:id])
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
			@user = User.find(params[:id])
		end

		private
		def user_params
			params.require(:user).permit(:username, :email, :password)
		end
end