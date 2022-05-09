class ChangeReferenceColumnToOrder < ActiveRecord::Migration[6.1]
  def up
    change_column :orders, :reference, :string, limit: 32, null: true
  end

  def down
    change_column :orders, :reference, :string, null: false, limit: 32
  end
end
