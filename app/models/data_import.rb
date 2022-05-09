class DataImport < ApplicationRecord
  # after_initialize :set_defaults

  has_one_attached :file

  enum status: { pending: 0, processing: 1, completed: 2, error: 3 }


  private
  
  def set_defaults
    self.pending!
  end
end
