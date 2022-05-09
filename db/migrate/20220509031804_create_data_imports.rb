class CreateDataImports < ActiveRecord::Migration[6.1]
  def change
    create_table :data_imports do |t|
      t.integer :status
      t.jsonb :errors

      t.timestamps
    end
  end
end
