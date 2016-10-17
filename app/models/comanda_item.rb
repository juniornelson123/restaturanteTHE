class ComandaItem < ApplicationRecord
	belongs_to :comanda
	belongs_to :product
end
