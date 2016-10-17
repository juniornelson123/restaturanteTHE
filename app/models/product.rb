class Product < ApplicationRecord
	#PAGINACAO
	paginates_per 3


	mount_uploader :image, ImageUploader

	belongs_to :category
	belongs_to :establishment

	has_many :comanda_items
end
