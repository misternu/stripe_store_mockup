class CreateAddresses < ActiveRecord::Migration[5.1]
  def change
    create_table :addresses do |t|
      t.references :user
      t.string :name
      t.string :line1
      t.string :line2
      t.string :city
      t.string :postal_code
      t.string :state
      t.string :country
      t.string :phone
    end
  end
end
