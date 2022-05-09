class Order < ApplicationRecord
  has_one :shipment
  validates :reference, uniqueness: true, allow_blank: true
  validates :reference, length: { maximum: 32 }
end
