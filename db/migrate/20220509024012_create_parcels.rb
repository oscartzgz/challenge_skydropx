class CreateParcels < ActiveRecord::Migration[6.1]
  def change
    create_table :parcels do |t|
      t.integer :lenght, null: false
      t.integer :width, null: false
      t.integer :height, null: false
      t.string :dimension_unit, null: false, limit: 2
      t.integer :weight, null: false
      t.string :weight_unit, null: false, limit: 2

      t.timestamps
    end
  end
end
