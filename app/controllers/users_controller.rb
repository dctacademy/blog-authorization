class UsersController < ApplicationController

	before_action :authenticate_user!
	load_and_authorize_resource

	def index
		@users = User.all
	end

	def new
		@user = User.new
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to users_path
		end
	end

	private 
	def user_params
		params[:user].permit(:email, :password, role_ids:[])
	end
end
