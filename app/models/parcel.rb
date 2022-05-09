class Parcel < ApplicationRecord
  validate_presence_of  :lenght,
                        :width,
                        :height,
                        :dimension_unit,
                        :weight,
                        :weight_unit

  validate :dimension_unit, format: { width: /.{2}/, message: 'Dimension unit allows only two characters' }
  validate :weight_unit, format: { width: /.{2}/, message: 'Weight unit allows only two characters' }
end
