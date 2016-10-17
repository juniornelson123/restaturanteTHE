class RemoveColumnAmountFromComanda < ActiveRecord::Migration[5.0]
  def change
    remove_column :comandas, :amount, :float
  end
end
