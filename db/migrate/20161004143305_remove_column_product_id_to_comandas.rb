class RemoveColumnProductIdToComandas < ActiveRecord::Migration[5.0]
  def change
    remove_column :comandas, :product_id, :integer
  end
end
