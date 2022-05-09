class CreateAddresses < ActiveRecord::Migration[6.1]
  def change
    create_table :addresses do |t|
      t.string :name, null: false, limit: 64
      t.string :email, null: false
      t.string :street1, null: false, limit: 128
      t.string :city, null: false, limit: 64
      t.string :province, null: false, limit: 64
      t.string :postal_code, null: false, limit: 5
      t.string :country_code, null: false, limit: 2

      t.timestamps
    end
  end
end
