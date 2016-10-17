class AddColumnImageToEstablishments < ActiveRecord::Migration[5.0]
  def change
    add_column :establishments, :image, :string
  end
end
