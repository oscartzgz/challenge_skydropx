class DataImport < ApplicationRecord
  before_create :set_defaults
  has_one_attached :file
  enum status: { pending: 0, processing: 1, completed: 2, error: 3 }

  validates_presence_of :file

  def file_path
    ActiveStorage::Blob.service.path_for(file.key)
  end

  def status
    super.upcase
  end

  private
  
  def set_defaults
    self.status = :pending
  end
end
