class UsersController < ApplicationController
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

		private
		def user_params
			params.require(:user).permit(:username, :email, :password)
		end
end