class Picture < ApplicationRecord
	validates :content, presence: true
	belongs_to :user
	mount_uploader :image, ImageUploader
	has_many :favorites, dependent: :destroy
	has_many :favorite_users, through: :favorites, source: :user
end
