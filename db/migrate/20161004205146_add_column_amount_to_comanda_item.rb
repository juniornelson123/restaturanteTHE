class AddColumnAmountToComandaItem < ActiveRecord::Migration[5.0]
  def change
    add_column :comanda_items, :amount, :float
  end
end
