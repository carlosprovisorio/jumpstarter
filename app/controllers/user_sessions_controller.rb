class UserSessionsController < ApplicationController
	skip_before_action :require_login, except: [:destroy]

	def new
		@user = User.new
	end

	def create
		if @user = login(params[:email], params[:password])
			redirect_back_or_to(:users, notice: 'Login successful')
		else
			flash.now[:alert] = 'Login failed'
			render action: 'new'
		end
	end

	def forgot_password
	end


	def submit_forgot_password
		@user = User.where(email: params[:email]).first
		 if @user
		 	@user.deliver_reset_password_instructions!
		 else
		 	flash.now[:alert] = 'Email not founded'
		 end
		 redirect_to(root_path, :notice => 'Instructions have been sent to your email.')
	end

	def destroy
		logout
		redirect_to(:users, notice: 'Logged out!')
	end


end

