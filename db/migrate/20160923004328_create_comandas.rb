class CreateComandas < ActiveRecord::Migration[5.0]
  def change
    create_table :comandas do |t|
      t.float :amount
      t.integer :product_id
      t.integer :establishment_id

      t.timestamps
    end
  end
end
