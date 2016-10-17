class CreateComandaItems < ActiveRecord::Migration[5.0]
  def change
    create_table :comanda_items do |t|
      t.integer :product_id
      t.integer :comanda_id

      t.timestamps
    end
  end
end
