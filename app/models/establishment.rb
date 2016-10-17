class Establishment < ApplicationRecord
	#PAGINACAO
	paginates_per 3
	
	#UPLOAD 
	mount_uploader :image, ImageUploader

	#RELACIONAMENTOS
	belongs_to :user
	
	has_many :products, dependent: :destroy
end
