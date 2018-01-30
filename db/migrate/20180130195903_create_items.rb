class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.references :cart
      t.string :sku
      t.string :name
      t.integer :quantity

      t.timestamps
    end
  end
end
