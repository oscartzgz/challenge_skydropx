class CreateOrders < ActiveRecord::Migration[6.1]
  def change
    create_table :orders do |t|
      t.string :reference, null: false, limit: 32

      t.timestamps
    end
  end
end
