class UsersController < ApplicationController
    def new
        @user = User.new
    end

		# POST /users or /users.json
    def create
			@user = User.new(user_params)
			@notice = "User creation is successful"

			respond_to do |format|
				if @user.save
						format.html { redirect_to @article, notice: @notice  }
						format.json { render :show, status: :created, location: @article }
				else
						format.html { render :new, status: :unprocessable_entity }
						format.json { render json: @user.errors, status: :unprocessable_entity }
				end
			end
    end
end