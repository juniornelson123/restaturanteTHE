class AddColumnTotalPriceToComanda < ActiveRecord::Migration[5.0]
  def change
    add_column :comandas, :total_price, :float
  end
end
