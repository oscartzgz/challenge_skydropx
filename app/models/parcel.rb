class Parcel < ApplicationRecord
  belongs_to :shipment

  validates_presence_of  :lenght,
                        :width,
                        :height,
                        :dimension_unit,
                        :weight,
                        :weight_unit

  validates :dimension_unit, format: { with: /.{2}/, message: 'Dimension unit allows only two characters' }
  validates :weight_unit, format: { with: /.{2}/, message: 'Weight unit allows only two characters' }
end
