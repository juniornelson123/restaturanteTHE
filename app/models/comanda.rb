class Comanda < ApplicationRecord
	has_many :comanda_items, dependent: :destroy 
	belongs_to :establishment
end
