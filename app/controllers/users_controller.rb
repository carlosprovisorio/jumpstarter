class UsersController < ApplicationController
	skip_before_action :require_login, only: [:index, :new, :create]

	def new
		@user= User.new
	end

	def index
		@users = User.all
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to(:users, notice: 'User was successfully created')
		else
 			render 'new'
		end
	end

	def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
     	redirect_to root_path
    else
      render 'edit'
    end
  end

	def edit
		@user = User.find(params[:id])
	end

	private

	def user_params
		params.require(:user).permit(:email, :password, :password_confirmation)
	end

end
