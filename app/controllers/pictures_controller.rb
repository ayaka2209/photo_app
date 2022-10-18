class PicturesController < ApplicationController
	before_action :set_picture, only:[:show, :edit, :update, :destroy]

	def index
		@pictures = Picture.all
	end

	def new
		if params[:back]
			@picture = Picture.new(picture_params)
		else
			@picture = Picture.new
		end
	end

	def destroy
		@picture.destroy
		redirect_to pictures_path, notice:"削除しました！"
	end

	def confirm
		@picture = current_user.pictures.build(picture_params)
		render :new if @picture.invalid?
	end

	def create
		@picture = current_user.pictures.build(picture_params)
		if params[:back]
			render :new
		else
			if @picture.save
				ContactMailer.contact_mail(@picture).deliver
				redirect_to pictures_path, notice: "写真を投稿しました！"
			else
				render :new
			end
		end
	end

	def show
		@picture = Picture.find(params[:id])
		@favorite = current_user.favorites.find_by(picture_id: @picture.id)
	end

	def edit
		#もし本人以外だったら投稿一覧画面に飛ばす　ログインした人のIDと編集しようとしている投稿の投稿者のIDが一致しなかったら
		#ログインした人のID current_user.id
		#編集しようとしている投稿の投稿者のID   @picture.user.id
		@picture = Picture.find(params[:id])
    if current_user.id != @picture.user.id
			redirect_to pictures_path, notice: "あなたはだめよ！"
    end
	end

	def update
		@picture = Picture.find(params[:id])
		if @picture.update(picture_params)
			redirect_to pictures_path, notice: "投稿しました!"
		else
			render :edit
		end
	end

	private

	def picture_params
		params.require(:picture).permit(:content, :image_cache, :image, :user_id)
	end

	def set_picture
		@picture = Picture.find(params[:id])
	end
end
