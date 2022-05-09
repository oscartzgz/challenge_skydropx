class Address < ApplicationRecord
  has_many :shipments, foreign_key: :address_from_id

  validates_presence_of  :name,
                        :email,
                        :street1,
                        :city,
                        :province,
                        :postal_code,
                        :country_code

  validates :name, length: { maximum: 64 }
  validates :street1, length: { maximum: 64 }, format: { with: /\A.*[^\%\$\&\@\+\|].*\z/, message: 'The "%, $, &, @, +, |" symbols are not allowed' }
  validates :city, length: { maximum: 64 }
  validates :province, length: { maximum: 64 }
  validates :email, format: { with: /[a-zA-z]*@*\.[a-zA-z]*/, message: 'Bad format' }
  validates :postal_code, format: { with: /\A\d{5}\z/, message: 'Only five numbers are allowed' }
  validates :country_code, length: { maximum: 2 }
end
