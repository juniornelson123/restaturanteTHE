class AddColumnEstablishmentIdToProducts < ActiveRecord::Migration[5.0]
  def change
  	 add_column :products, :establishment_id, :integer
  end
end
