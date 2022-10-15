class UsersController < ApplicationController
	skip_before_action :login_required, only: [:new, :create, :edit, :update]

	def index
	end

	def new
		if params[:back]
			@user = User.new(user_params)
		else
			@user = User.new
		end
	end

	def confirm
		@user = User.new(user_params)
	end

	def create
		@user = User.new(user_params)
		if @user.save
			redirect_to user_path(@user.id)
		else
			render :new
		end
	end

	def show
		@user = User.find(params[:id])

		# favorites = 
	end

	def edit
		@user = User.find(params[:id])
	end

	def update
		@user = User.find(params[:id])
		if @user.update(user_params)
			redirect_to user_path, notice: "投稿しました!"
		else
			render :edit
		end
	end

	private

	def user_params
		params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :image_cache)
	end

end
