class AddShipmentReferenceToParcel < ActiveRecord::Migration[6.1]
  def change
    add_reference :parcels, :shipment, null: false, foreign_key: true
  end
end
