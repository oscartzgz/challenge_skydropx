class ChangeErrorsToErrorsLogsToDataImport < ActiveRecord::Migration[6.1]
  def change
    rename_column :data_imports, :errors, :import_errors
  end
end
