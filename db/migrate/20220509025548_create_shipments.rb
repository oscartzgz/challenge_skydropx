class CreateShipments < ActiveRecord::Migration[6.1]
  def change
    create_table :shipments do |t|
      t.references :order, null: false, foreign_key: true
      t.references :address_from, null: false
      t.references :address_to, null: false

      t.timestamps
    end
  end
end
