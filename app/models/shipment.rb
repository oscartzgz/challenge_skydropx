class Shipment < ApplicationRecord
  belongs_to :order
  belongs_to :address_from, class_name: 'Address' 
  belongs_to :address_to, class_name: 'Address'
  has_many :parcels
end
